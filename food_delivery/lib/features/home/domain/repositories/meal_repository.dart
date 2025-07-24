import '../entities/category_entity.dart';
import '../entities/meal_entity.dart';

abstract class MealRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<MealEntity>> getMealsByCategory(String category);
}
