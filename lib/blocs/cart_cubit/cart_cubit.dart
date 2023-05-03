import 'package:bloc/bloc.dart';
import 'package:flutter_meals_app_updated/models/meal.dart';

class CartCubit extends Cubit<List<Meal>> {
  CartCubit() : super([]);

  void addMealToCart(Meal meal) {
    List<Meal> newList = List.from(state);
    newList.add(meal);
    emit(newList);
  }

  void removeMealToCart(Meal meal) {
    List<Meal> newList = List.from(state);
    newList.remove(meal);
    emit(newList);
  }
}
