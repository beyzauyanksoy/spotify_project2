import 'package:flutter/material.dart';

import '../model/featured_playlists_model.dart';
import '../model/spotify_model.dart';
import '../services/spotify_services.dart';

class SpotifyProvider with ChangeNotifier {
  SpotifyCategoryModel? response = SpotifyCategoryModel();
  getCategory() async {
    response = await Services().getSpotifyModel();

    notifyListeners();
  }

  FeaturedPlaylistsModel? responseplaylist = FeaturedPlaylistsModel();
  getPlayList() async {
    responseplaylist = await Services().getPlayList();

    notifyListeners();
  }
}
