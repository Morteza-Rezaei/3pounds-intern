class MealEntity {
  final String id;
  final String name;
  final String thumbnail;

  MealEntity({required this.id, required this.name, required this.thumbnail});

  factory MealEntity.fromJson(Map<String, dynamic> json) {
    return MealEntity(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}
