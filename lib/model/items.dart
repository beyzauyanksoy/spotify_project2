import 'icons.dart';

class Items {
  String? href;
  List<Icons>? icons;
  String? id;
  String? name;

  Items({
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  Items copyWith({
    String? href,
    List<Icons>? icons,
    String? id,
    String? name,
  }) {
    return Items(
      href: href ?? this.href,
      icons: icons ?? this.icons,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'icons': icons,
      'id': id,
      'name': name,
    };
  }

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      href: json['href'] as String?,
      icons: (json['icons'] as List<dynamic>?)
          ?.map((e) => Icons.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}
