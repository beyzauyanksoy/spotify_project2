import 'package:flutter/material.dart';

import '../model/categories_model.dart';
import '../model/spotify_model.dart';
import '../services/spotify_services.dart';

class SpotifyProvider with ChangeNotifier {
  SpotifyModel? response = SpotifyModel();
  getWeatherData() async {
    response = await getSpotify();

    notifyListeners();
  }
}
