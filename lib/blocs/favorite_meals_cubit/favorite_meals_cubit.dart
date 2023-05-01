import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/models/meal.dart';

class FavoriteMealsCubit extends Cubit<List<Meal>> {
  FavoriteMealsCubit() : super([]);

  void addFavoriteMeal(Meal meal) {
    List<Meal> newList = List.from(state);
    newList.add(meal);
    emit(newList);
  }

  void removeFavoriteMeal(Meal meal) {
    List<Meal> newList = List.from(state);
    newList.remove(meal);
    emit(newList);
  }
}
