import 'package:dio/dio.dart';

import '../model/spotify_model.dart';

class Services {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
    "Authorization":
        "Bearer BQCtje8UL9a__dXZkQ7FtI6z8JHS-vwTykrmei-XK6OZ9qXNcmLjqt44a332q1sbyVk30U4YwldfTdp6t3lhdEbDmdMYteqqtuG3gWxvf4HwG-h-80bE8DPefs6lPo3KvXS1iQnGt6UKS9_JnJ3dPoyaCzSEdazJrvZWuYypEwQ6sCjHX5q0opPWNQpg2y6Qd-Na6bcOq4L1iG8Q7zncZCV4-SEva5Ddx0sAs6ODuFovL2SlVY7UrIvV0sT0OeK93T6EmEEmWuwpJfBH_Naqu0Br4fAIfJ1czXct6tIc"
  }));

  Future<SpotifyCategoryModel?> getSpotifyModel() async {
    SpotifyCategoryModel? searchModel;
    try {
      final response = await _dio
          .get("browse/categories?country=TR&locale=tr_TR&limit=20&offset=1");

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
}
