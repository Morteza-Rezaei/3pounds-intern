class MealEntity {
  final String name;
  final String restaurantName;
  final String description;
  final double rating;
  final String delivery; // "Ücretsiz" ya da "₺X"
  final String deliveryTime;
  final String size;
  final String category;
  final List<String> ingredients;
  final String imageUrl;
  final String price;

  MealEntity({
    required this.name,
    required this.restaurantName,
    required this.description,
    required this.rating,
    required this.delivery,
    required this.deliveryTime,
    required this.size,
    required this.category,
    required this.ingredients,
    required this.imageUrl,
    required this.price,
  });
}
