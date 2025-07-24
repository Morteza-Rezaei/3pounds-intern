class CategoryEntity {
  final String name;
  final String thumbnail;
  final String description;

  CategoryEntity({
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      name: json['strCategory'],
      thumbnail: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}
