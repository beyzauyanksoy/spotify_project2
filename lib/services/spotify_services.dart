import 'package:dio/dio.dart';

import '../model/featured_playlists_model.dart';
import '../model/spotify_model.dart';

class Services {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
      "Authorization":
          "Bearer BQB7WQ8bTNBb3C8POu2L9pZvNk8-x2QJeN4jpVAYwlKwvulJvxsBM5wwORooOSi192bidnistNmFxiJR5M-v7flNk8UUregwlJqF5Mmc_X_DFv6JCk4X5bI4wSwrP6-x08zSukF3xz7seT9ksp445TiYBJSBhoup58CmZ6heTJoa5GaRhy2Y_b6xw_ImWKKOKBq0vmfnJ_ZDhbttlQ0n4UhJmo8hljcF8lPRzZftEYLK45LqwtIHUpoxClgvYEYkfcsa5uOw6XqvsEc-dJvZhgXUSPxA9o8Quno5vdnR"
    }),
  );

  Future<SpotifyCategoryModel?> getSpotifyModel() async {
    SpotifyCategoryModel? searchModel;
    try {
      final response =
          await _dio.get("browse/featured-playlists?country=TR&locale=tr_TR");

      if (response.statusCode == 200) {
        print("Çalışıyor");
        searchModel = SpotifyCategoryModel.fromJson(response.data);
        print(searchModel.categories);
      } else {
        print("Çalışmıyor");
      }
      return searchModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<FeaturedPlaylistsModel?> getPlayList() async {
    FeaturedPlaylistsModel? playlistmodel;
    try {
      final response1 = await _dio
          .get("browse/categories?country=TR&locale=tr_TR&limit=20&offset=1");

      if (response1.statusCode == 200) {
        print("Çalışıyor");
        playlistmodel = FeaturedPlaylistsModel.fromJson(response1.data);
        print(playlistmodel.playlists);
      } else {
        print("Çalışmıyor");
      }
      return playlistmodel;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
