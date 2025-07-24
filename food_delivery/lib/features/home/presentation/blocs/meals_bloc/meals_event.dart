import 'package:equatable/equatable.dart';

abstract class MealsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMealsByCategory extends MealsEvent {
  final String category;

  FetchMealsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}
