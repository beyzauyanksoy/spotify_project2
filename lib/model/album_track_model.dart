// To parse this JSON data, do
//
//     final albumTrackModel = albumTrackModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

AlbumTrackModel albumTrackModelFromJson(String str) =>
    AlbumTrackModel.fromJson(json.decode(str));

class AlbumTrackModel {
  AlbumTrackModel({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String? href;
  List<Item>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  factory AlbumTrackModel.fromJson(Map<String, dynamic> json) =>
      AlbumTrackModel(
        href: json["href"] == null ? null : json["href"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"] == null ? null : json["limit"],
        next: json["next"] == null ? null : json["next"],
        offset: json["offset"] == null ? null : json["offset"],
        previous: json["previous"] == null ? null : json["previous"],
        total: json["total"] == null ? null : json["total"],
      );
}

class Item {
  Item({
    this.artists,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  List<Artist>? artists;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: json["artists"] == null
            ? null
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"] == null ? null : json["disc_number"],
        durationMs: json["duration_ms"] == null ? null : json["duration_ms"],
        explicit: json["explicit"] == null ? null : json["explicit"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        isLocal: json["is_local"] == null ? null : json["is_local"],
        isPlayable: json["is_playable"] == null ? null : json["is_playable"],
        name: json["name"] == null ? null : json["name"],
        previewUrl: json["preview_url"] == null ? null : json["preview_url"],
        trackNumber: json["track_number"] == null ? null : json["track_number"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class Artist {
  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify == null ? null : spotify,
      };
}
