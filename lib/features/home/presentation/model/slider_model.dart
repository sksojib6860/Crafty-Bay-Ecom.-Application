class SliderModels {
  final String id;
  final String photoUrl;
  final String description;
  final String? brand;
  final String? category;

  SliderModels({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
    required this.category,
  });

  factory SliderModels.fromJson(Map<String, dynamic> json) {
    return SliderModels(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      brand: json['brand'],
      category: json['category'],
    );
  }
}
