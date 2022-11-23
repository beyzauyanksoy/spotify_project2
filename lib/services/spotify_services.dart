import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categories_model.dart';
import '../model/spotify_model.dart';

Future<SpotifyModel> getSpotify()async{
 SpotifyModel? data = SpotifyModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQAPjMKWqEs8YOZThAqEGHLqKKZvLmBh3ZVigkETUw0dL32gFy5QWH90o5KlYmBdN5WwsS1cgHYGv8jXp6n1Z6qK992aGNeWoTmwdi3NGfYKsMYWBoN810SioOo_qgcRHpy-uQZ_otAsqHoIFosrJDU_qIcgO_dsQhkmAx4EZHiVBSrIfJk3305TDJTpOQ0By6Zivav2CYvTfMI8RDCZAohvoKJYUxfjmSdB0-HK6KFveojUfrsDS_lCKFc8tn7LNKeTB2OdCbaKw21XeJNcsGRJJcFp1sLidrRW3ajB',
  };

  var params = {
    'country': 'TR',
    'locale': 'tr_TR',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/browse/categories?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data=SpotifyModel.fromJson(jsonDecode(res.body));
  return data;
}

