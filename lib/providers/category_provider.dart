import 'package:flutter/material.dart';

import '../model/spotify_model.dart';
import '../services/spotify_services.dart';

class SpotifyProvider with ChangeNotifier {
  SpotifyCategoryModel? response = SpotifyCategoryModel();
  getCategory() async {
    response = await Services().getSpotifyModel();

    notifyListeners();
  }
}
