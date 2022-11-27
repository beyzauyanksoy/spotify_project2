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
    "BQCrmX4NEsUYULRVgHfnlgSfZIH9tbdvm1NSrC54oULKh8mLsJZZ4JI8Mm2sfddy3XID3TX_KDts34hZLTxNseOlN_Q9w5-E40hHGNjfUftaLpywy2KvzYGvk1WuEoPvL5OzioMNAmAotYPRZJnYbxDTcPM4JRRJqYyMxUTgsD5dGoE8tBlCYgQny6vtzRM3_ht5d2F0AysdbcdjnyTkxGaD6FaUrRNrxIAVjtRxmYI58xp2BnCFACjTJO0d0dbc28gEpZwD8VnwNft7hI9Vo3F8oplAGf6j67il4Zz7";

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
