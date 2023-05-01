import 'package:bloc/bloc.dart';
import 'package:flutter_meals_app_updated/blocs/filters_bloc/filters_bloc.dart';
import 'package:flutter_meals_app_updated/data/data.dart';
import 'package:flutter_meals_app_updated/models/filter_data.dart';
import 'package:flutter_meals_app_updated/models/meal.dart';

class FilteredMealsCubit extends Cubit<List<Meal>> {
  FilteredMealsCubit({
    required List<Meal> meals,
    required FiltersBloc filteredBloc,
  }) : super([]) {
    _filter(meals, filteredBloc);
  }

  void _filter(List<Meal> meals, FiltersBloc filteredBloc) {
    final List<FilterData> filterData = filteredBloc.state.filterList;

    List<Meal> filteredMeals = meals.where((meal) {
      if (filterData
              .firstWhere((element) => element.filter == Filter.glutenFree)
              .value &&
          !meal.isGlutenFree) {
        return false;
      }
      if (filterData
              .firstWhere((element) => element.filter == Filter.lactoseFree)
              .value &&
          !meal.isLactoseFree) {
        return false;
      }
      if (filterData
              .firstWhere((element) => element.filter == Filter.vegan)
              .value &&
          !meal.isVegan) {
        return false;
      }
      if (filterData
              .firstWhere((element) => element.filter == Filter.vegetarian)
              .value &&
          !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    emit(filteredMeals);
  }
}
