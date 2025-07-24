import '../../domain/entities/category_entity.dart';
import '../../domain/entities/meal_entity.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_remote_datasource.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource dataSource;

  MealRepositoryImpl(this.dataSource);

  @override
  Future<List<CategoryEntity>> getCategories() => dataSource.getCategories();

  @override
  Future<List<MealEntity>> getMealsByCategory(String category) =>
      dataSource.getMealsByCategory(category);
}
