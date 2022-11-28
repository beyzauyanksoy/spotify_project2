// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel {
    ProfileModel({
        this.country,
        this.displayName,
        this.email,
        this.explicitContent,
        this.externalUrls,
        this.followers,
        this.href,
        this.id,
        this.images,
        this.product,
        this.type,
        this.uri,
    });

    String ?country;
    String ?displayName;
    String ?email;
    ExplicitContent? explicitContent;
    ExternalUrls? externalUrls;
    Followers? followers;
    String ?href;
    String? id;
    List<dynamic>? images;
    String? product;
    String? type;
    String? uri;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        country: json["country"] == null ? null : json["country"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        email: json["email"] == null ? null : json["email"],
        explicitContent: json["explicit_content"] == null ? null : ExplicitContent.fromJson(json["explicit_content"]),
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null ? null : Followers.fromJson(json["followers"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
        product: json["product"] == null ? null : json["product"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
    );

}

class ExplicitContent {
    ExplicitContent({
        this.filterEnabled,
        this.filterLocked,
    });

    bool ?filterEnabled;
    bool ?filterLocked;

    factory ExplicitContent.fromJson(Map<String, dynamic> json) => ExplicitContent(
        filterEnabled: json["filter_enabled"] == null ? null : json["filter_enabled"],
        filterLocked: json["filter_locked"] == null ? null : json["filter_locked"],
    );

    Map<String, dynamic> toJson() => {
        "filter_enabled": filterEnabled == null ? null : filterEnabled,
        "filter_locked": filterLocked == null ? null : filterLocked,
    };
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
    int ?total;

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total == null ? null : total,
    };
}
