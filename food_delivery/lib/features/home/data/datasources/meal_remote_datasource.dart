import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/meal_entity.dart';

class MealRemoteDataSource {
  final client = http.Client();

  Future<List<CategoryEntity>> getCategories() async {
    final res = await client.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    );
    final data = jsonDecode(res.body);
    return (data['categories'] as List)
        .map((json) => CategoryEntity.fromJson(json))
        .toList();
  }

  Future<List<MealEntity>> getMealsByCategory(String category) async {
    final res = await client.get(
      Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category',
      ),
    );
    final data = jsonDecode(res.body);
    return (data['meals'] as List)
        .map((json) => MealEntity.fromJson(json))
        .toList();
  }
}
