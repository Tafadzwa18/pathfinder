class Attraction {
  final String id;
  final String name;
  final String description;
  final String? categoryId;
  final String? imageUrl;
  final double latitude;
  final double longitude;
  final String? openingHours;
  final String? entryFee;
  final String? contactInfo;
  final String? activities;
  final bool isFeatured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Attraction({
    required this.id,
    required this.name,
    required this.description,
    this.categoryId,
    this.imageUrl,
    required this.latitude,
    required this.longitude,
    this.openingHours,
    this.entryFee,
    this.contactInfo,
    this.activities,
    this.isFeatured = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      categoryId: json['category_id'],
      imageUrl: json['image_url'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      openingHours: json['opening_hours'],
      entryFee: json['entry_fee'],
      contactInfo: json['contact_info'],
      activities: json['activities'],
      isFeatured: json['is_featured'] ?? false,
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category_id': categoryId,
      'image_url': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'opening_hours': openingHours,
      'entry_fee': entryFee,
      'contact_info': contactInfo,
      'activities': activities,
      'is_featured': isFeatured,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
