import 'package:dio/dio.dart';

import '../model/spotify_model.dart';

class Services {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
    "Authorization":
        "Bearer BQAsDL-jWOL_RG9kmc9GUObRzd8HJoIIcIbUzrzkauz6mBFNcSQ2fBV1XEfZCZ7uPGcd494kt9DwaxpfEKUBzYIYOtnzZVAVMGByQiBAGfmaVByP3tPpRVoV8cvv4vzqIQ8ZKpzxhazJnTiM7dNsSD97eAntaCdRdVKdYK4Ot77YqHhBHZ1S-Us7x4mo2LjSjuZLIWWQaycplVruZIQkC1_i046scZgOOkv9DZtYk9Zpr2glwfP21luXqjEF4JI8GdY1MRAk66c9AL2hDhQh3odFA7f46yYaGYvSIEzb"
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
