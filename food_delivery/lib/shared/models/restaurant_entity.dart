import 'meal_entity.dart';

class RestaurantEntity {
  final String name;
  final String description;
  final double rating;
  final String deliveryType;
  final String deliveryTime;
  final String imageUrl;
  final List<MealEntity> meals;

  RestaurantEntity({
    required this.name,
    required this.description,
    required this.rating,
    required this.deliveryType,
    required this.deliveryTime,
    required this.imageUrl,
    required this.meals,
  });
}
