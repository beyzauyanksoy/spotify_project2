// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

AlbumModel albumModelFromJson(String str) =>
    AlbumModel.fromJson(json.decode(str));

class AlbumModel {
  AlbumModel({
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

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
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
    this.albumGroup,
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  String? albumGroup;
  String? albumType;
  List<Artist>? artists;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  DateTime? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        albumGroup: json["album_group"] == null ? null : json["album_group"],
        albumType: json["album_type"] == null ? null : json["album_type"],
        artists: json["artists"] == null
            ? null
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"] == null
            ? null
            : json["release_date_precision"],
        totalTracks: json["total_tracks"] == null ? null : json["total_tracks"],
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

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
      };
}
