import 'package:dio/dio.dart';

import '../model/spotify_model.dart';

class Services {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
    "Authorization":
        "Bearer BQAWVMxiAkuixH0PVQDlYkG8LocpnDlMuRHBC6UOjq5p2bithhaGkNOrJ_-Qw3k84sUUGjwb1eSmeOC1CDPZleqnX1MybDyxRHMy-v6hvA3qKnlbXjTf0b_i8cfR9UElT7KjgQ2Bq3CIBJRSrS19maM0wktz_roUIcFQuBXMB5WuLlsPFv-ESEmsAblCDNtjtiQnUKYj26ugib_7ONwkOx7rdx31H6XZ9tKhRojD5bqS_-h5atvQbRXni6HviCuMEFDU6uDhv_x4-frt5kHrntGJERvPIFqEGCabATqP"
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
