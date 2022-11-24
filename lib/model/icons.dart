class Icons {
  int? height;
  String? url;
  int? width;

  Icons({
    this.height,
    this.url,
    this.width,
  });

  Icons copyWith({
    int? height,
    String? url,
    int? width,
  }) {
    return Icons(
      height: height ?? this.height,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'url': url,
      'width': width,
    };
  }

  factory Icons.fromJson(Map<String, dynamic> json) {
    return Icons(
      height: json['height'] as int?,
      url: json['url'] as String?,
      width: json['width'] as int?,
    );
  }
}
