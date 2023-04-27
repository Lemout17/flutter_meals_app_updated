part of 'favorite_meals_cubit.dart';

abstract class FavoriteMealsState extends Equatable {
  final List<Meal> favoriteMeals;
  const FavoriteMealsState(this.favoriteMeals);

  @override
  List<Object> get props => [favoriteMeals];
}

class DataFavoriteMealsState extends FavoriteMealsState {
  const DataFavoriteMealsState(super.favoriteMeals);
}
