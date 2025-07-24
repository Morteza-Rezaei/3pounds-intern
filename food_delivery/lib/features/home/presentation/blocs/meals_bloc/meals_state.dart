import 'package:equatable/equatable.dart';
import '../../../domain/entities/meal_entity.dart';

abstract class MealsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<MealEntity> meals;

  MealsLoaded(this.meals);

  @override
  List<Object?> get props => [meals];
}

class MealsError extends MealsState {
  final String message;

  MealsError(this.message);

  @override
  List<Object?> get props => [message];
}
