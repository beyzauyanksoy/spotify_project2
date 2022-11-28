// To parse this JSON data, do
//
//     final artistModel = artistModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ArtistModel artistModelFromJson(String str) =>
    ArtistModel.fromJson(json.decode(str));

class ArtistModel {
  ArtistModel({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        popularity: json["popularity"] == null ? null : json["popularity"],
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

class Followers {
  Followers({
    this.href,
    this.total,
  });

  dynamic href;
  int? total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total == null ? null : total,
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
