import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotify_project_2/model/album_model.dart';
import 'package:spotify_project_2/model/artist_model.dart';

import '../model/album_track_model.dart';
import '../model/album_track_search_model.dart';
import '../model/category_model.dart';
import '../model/featured_playlist_model.dart';
import '../model/playlist_model.dart';
import '../model/profile_model.dart';
import '../model/userplaylist_model.dart';

String token =
    "BQCwVHT2aeiXo4PlS6PsVffCHFH9k6OfUjJYrcHtCF6J2yWmgPrPoIfdR5RpvQfI8pOiVZJAh745bxHnYmcF0dUkpr4KEveSBHQlvDXdCF5E3C0kT44r9MqGw0QujLMjdW84Qt8My93nX1fW7OMXuaAWS0ffLjGRRsJtMd17LjRG6bjrDTQ5rgQ_io3de_nEatIViYD2VUAOfl8xXmTlK7JGAxxmgMMgpxsfxU75WIDhV0sVyUFveZpYKz4Iu788eNszpOk7MLTzKq7XwKj-0EcluwkFR43iN77clzlQ";

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


  Future<SearchModels?> getSearch({required String query}) async {
  SearchModels searchModels;
 
  try {
  
    try {
      final response = await _dio
          .get("search?q=$query&type=track%2Cartist&market=TR&limit=20&offset=1");
      searchModels = SearchModels.fromJson(response.data);
   
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return searchModels;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}



}
