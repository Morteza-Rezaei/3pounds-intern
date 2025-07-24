import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_event.dart';
import 'categories_state.dart';
import '../../../data/datasources/meal_remote_datasource.dart';
import '../../../data/repositories/meal_repository_impl.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final repository = MealRepositoryImpl(MealRemoteDataSource());
        final categories = await repository.getCategories();
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
