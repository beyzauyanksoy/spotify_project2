import 'items.dart';

class Categories {
  String? href;
  List<Items>? items;
  int? limit;
  String? next;
  int? offset;
  Null? previous;
  int? total;

  Categories({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  Categories copyWith({
    String? href,
    List<Items>? items,
    int? limit,
    String? next,
    int? offset,
    Null? previous,
    int? total,
  }) {
    return Categories(
      href: href ?? this.href,
      items: items ?? this.items,
      limit: limit ?? this.limit,
      next: next ?? this.next,
      offset: offset ?? this.offset,
      previous: previous ?? this.previous,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'items': items,
      'limit': limit,
      'next': next,
      'offset': offset,
      'previous': previous,
      'total': total,
    };
  }

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      href: json['href'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int?,
      next: json['next'] as String?,
      offset: json['offset'] as int?,
      previous: json['previous'] as Null?,
      total: json['total'] as int?,
    );
  }
}
