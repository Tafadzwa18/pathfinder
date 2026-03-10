class Category {
  final String id;
  final String name;
  final String? iconUrl;
  final DateTime createdAt;

  Category({
    required this.id,
    required this.name,
    this.iconUrl,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      iconUrl: json['icon_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon_url': iconUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
