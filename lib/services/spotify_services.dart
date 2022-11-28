import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotify_project_2/model/album_model.dart';
import 'package:spotify_project_2/model/artist_model.dart';

import '../model/album_track_model.dart';
import '../model/category_model.dart';
import '../model/featured_playlist_model.dart';
import '../model/playlist_model.dart';
import '../model/profile_model.dart';
import '../model/userplaylist_model.dart';

String token =
    "BQB9xc2WyJJt_EU2Hkol6USZ1G75wEckBsd8ZjFLYq113OLQUEWdvHUEnvB-I49hWe2-P3BH42R2yQto7ZLHpQJA_UnAMVMNodrGPBqBnU8tbYVReHoCgWYxEOHCIZ5VOFRNtbX2jP-B8B-tyFi9ntMvSVR-BWcQBJDkvVICyXcdf3hV5gpI5IlHM_gHe6eVQV986DUdWq7MvIBzGONuuYJmi9mVpjIxcQGGn7H2ClUvI69V4bJbCpUB0hTG0toRnYLuJWAQCB4_aOFzW488cDGur3ENYVS0KgBvjLQx";

class Services {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.spotify.com/v1/",
      headers: {"Authorization": "Bearer $token"},
    ),
  );

  Future<CategoryModel?> getCategories() async {
    CategoryModel? model;

    try {
      final response = await _dio
          .get("browse/categories?country=TR&locale=tr_TR&limit=20&offset=1");
      if (response.statusCode == 200) {
        model = CategoryModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<FeaturedPlaylistModel?> getFeaturedPlaylists() async {
    FeaturedPlaylistModel? model;

    try {
      DateTime now = DateTime.now();
      final response = await _dio.get(
          "browse/featured-playlists?country=TR&locale=tr_TR&timestamp=${now.year}-${now.month}-${now.day}T09%3A00%3A00.000Z&limit=20&offset=1");
      if (response.statusCode == 200) {
        model = FeaturedPlaylistModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<PlaylistModel?> getPlaylistWithId(String? id) async {
    PlaylistModel? model;
    try {
      final response = await _dio.get("playlists/$id?market=TR");
      if (response.statusCode == 200) {
        model = PlaylistModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<AlbumModel?> getAlbum(String? id) async {
    AlbumModel? model;
    try {
      final response =
          await _dio.get("artists/$id/albums?market=ES&limit=20&offset=1");
      if (response.statusCode == 200) {
        model = AlbumModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<ArtistModel?> getArtist(String? id) async {
    ArtistModel? model;
    try {
      final response = await _dio.get("artists/$id");
      if (response.statusCode == 200) {
        model = ArtistModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<AlbumTrackModel?> getAlbumTracks(String? id) async {
    AlbumTrackModel? model;
    try {
      final response = await _dio.get("albums/$id/tracks");
      if (response.statusCode == 200) {
        model = AlbumTrackModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<ProfileModel?> getProfil() async {
    ProfileModel? model;

    try {
      final response = await _dio.get("me");
      if (response.statusCode == 200) {
        model = ProfileModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  Future<UserPlayListModel?> getuserplaylist() async {
    UserPlayListModel? model;

    try {
      final response =
          await _dio.get("users/smedjan/playlists?limit=20&offset=1");
      if (response.statusCode == 200) {
        model = UserPlayListModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }
}
