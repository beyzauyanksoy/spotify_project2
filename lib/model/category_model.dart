// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.categories,
  });

  Categories? categories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: json["categories"] == null
            ? null
            : Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null ? null : categories?.toJson(),
      };
}

class Categories {
  Categories({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  dynamic href;
  List<Item>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  factory Categories.fromJson(Map<dynamic, dynamic> json) => Categories(
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
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  dynamic href;
  List<Icon>? icons;
  dynamic id;
  dynamic name;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        href: json["href"] == null ? null : json["href"],
        icons: json["icons"] == null
            ? null
            : List<Icon>.from(json["icons"].map((x) => Icon.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "icons": icons == null
            ? null
            : List<dynamic>.from(icons!.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class Icon {
  Icon({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  dynamic url;
  int? width;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
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
