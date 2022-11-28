// To parse this JSON data, do
//
//     final userPlayListModel = userPlayListModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserPlayListModel userPlayListModelFromJson(String str) =>
    UserPlayListModel.fromJson(json.decode(str));

String userPlayListModelToJson(UserPlayListModel data) =>
    json.encode(data.toJson());

class UserPlayListModel {
  UserPlayListModel({
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

  factory UserPlayListModel.fromJson(Map<String, dynamic> json) =>
      UserPlayListModel(
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

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit == null ? null : limit,
        "next": next == null ? null : next,
        "offset": offset == null ? null : offset,
        "previous": previous == null ? null : previous,
        "total": total == null ? null : total,
      };
}

class Item {
  Item({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  bool? collaborative;
  String? description;
  ItemExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  Owner? owner;
  dynamic primaryColor;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collaborative:
            json["collaborative"] == null ? null : json["collaborative"],
        description: json["description"] == null ? null : json["description"],
        externalUrls: json["external_urls"] == null
            ? null
            : ItemExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"] == null ? null : json["public"],
        snapshotId: json["snapshot_id"] == null ? null : json["snapshot_id"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative == null ? null : collaborative,
        "description": description == null ? null : description,
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "owner": owner == null ? null : owner?.toJson(),
        "primary_color": primaryColor,
        "public": public == null ? null : public,
        "snapshot_id": snapshotId == null ? null : snapshotId,
        "tracks": tracks == null ? null : tracks?.toJson(),
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class ItemExternalUrls {
  ItemExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory ItemExternalUrls.fromJson(Map<String, dynamic> json) =>
      ItemExternalUrls(
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

class Owner {
  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  String? displayName;
  OwnerExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"] == null ? null : json["display_name"],
        externalUrls: json["external_urls"] == null
            ? null
            : OwnerExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName == null ? null : displayName,
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class OwnerExternalUrls {
  OwnerExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory OwnerExternalUrls.fromJson(Map<String, dynamic> json) =>
      OwnerExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify == null ? null : spotify,
      };
}

class Tracks {
  Tracks({
    this.href,
    this.total,
  });

  String? href;
  int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"] == null ? null : json["href"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "total": total == null ? null : total,
      };
}
