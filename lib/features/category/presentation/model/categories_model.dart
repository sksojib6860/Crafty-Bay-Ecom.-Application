class CategoriesModel {
  final String id;
  final String title;
  final String description;
  final String icon;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
