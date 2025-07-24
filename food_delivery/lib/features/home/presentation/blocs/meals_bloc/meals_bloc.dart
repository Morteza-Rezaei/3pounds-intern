import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/domain/entities/meal_entity.dart';
import '../../../data/datasources/meal_remote_datasource.dart';
import '../../../data/repositories/meal_repository_impl.dart';
import 'meals_event.dart';
import 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitial()) {
    on<FetchMealsByCategory>((event, emit) async {
      final category = event.category.trim();
      try {
        final repository = MealRepositoryImpl(MealRemoteDataSource());

        if (category.isEmpty) {
          // Tüm kategorileri al
          final allCategories = await repository.getCategories();

          // Her kategori için yemekleri ayrı ayrı çek
          final allMeals = <MealEntity>[];
          for (final cat in allCategories) {
            final meals = await repository.getMealsByCategory(cat.name);
            allMeals.addAll(meals);
          }

          emit(MealsLoaded(allMeals));
          return;
        }

        // Belirli kategori için yemekler
        final meals = await repository.getMealsByCategory(category);
        emit(MealsLoaded(meals));
      } catch (e) {
        emit(MealsError(e.toString()));
      }
    });
  }
}
