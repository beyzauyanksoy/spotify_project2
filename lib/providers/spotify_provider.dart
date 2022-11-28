import 'package:flutter/material.dart';
import 'package:spotify_project_2/model/album_model.dart';
import 'package:spotify_project_2/model/album_track_model.dart';
import 'package:spotify_project_2/model/artist_model.dart';
import 'package:spotify_project_2/model/category_model.dart';
import 'package:spotify_project_2/model/featured_playlist_model.dart';

import '../model/playlist_model.dart';
import '../model/profile_model.dart';
import '../model/userplaylist_model.dart';
import '../services/spotify_services.dart';

class SpotifyProvider with ChangeNotifier {
  CategoryModel? categories = CategoryModel();
  FeaturedPlaylistModel? featuredPlaylistModel = FeaturedPlaylistModel();
  PlaylistModel? playlistModel = PlaylistModel();
  AlbumModel? albumModel = AlbumModel();
  ArtistModel? artistModel = ArtistModel();
  AlbumTrackModel? artistSongs = AlbumTrackModel();
  ProfileModel? userprofil = ProfileModel();
  UserPlayListModel? userplaylist = UserPlayListModel();

  getCategories() async {
    categories = await Services().getCategories();
    notifyListeners();
  }

  getFeaturedPlaylists() async {
    featuredPlaylistModel = await Services().getFeaturedPlaylists();
    notifyListeners();
  }

  getPlaylistWithId(String? id) async {
    playlistModel = await Services().getPlaylistWithId(id);
    notifyListeners();
  }

  getAlbum(String? id) async {
    albumModel = await Services().getAlbum(id);
    notifyListeners();
  }

  getArtist(String? id) async {
    artistModel = await Services().getArtist(id);
    notifyListeners();
  }

  getAlbumTracks(String? id) async {
    artistSongs = await Services().getAlbumTracks(id);
    notifyListeners();
  }

  getProfile() async {
    userprofil = await Services().getProfil();
    notifyListeners();
  }

  getuserplaylist() async {
    userplaylist = await Services().getuserplaylist();
    notifyListeners();
  }
}
