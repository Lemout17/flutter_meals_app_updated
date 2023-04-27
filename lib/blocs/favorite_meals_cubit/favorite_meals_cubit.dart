import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/models/meal.dart';

part 'favorite_meals_state.dart';

class FavoriteMealsCubit extends Cubit<FavoriteMealsState> {
  FavoriteMealsCubit() : super(const DataFavoriteMealsState([]));

  void addFavoriteMeal(Meal meal) {
    List<Meal> newList = List.from(state.favoriteMeals);
    newList.add(meal);
    emit(DataFavoriteMealsState(newList));
  }

  void removeFavoriteMeal(Meal meal) {
    List<Meal> newList = List.from(state.favoriteMeals);
    newList.remove(meal);
    emit(DataFavoriteMealsState(newList));
  }
}
