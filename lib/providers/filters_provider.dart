import 'package:flutter_meals_app_updated/models/filter_data.dart';
import 'package:flutter_meals_app_updated/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

final List<FilterData> initialState = [
  FilterData(
    title: 'Gluten - free',
    subtitle: 'Only include gluten-free meals',
  ),
  FilterData(
    title: 'Lactose - free',
    subtitle: 'Only include lactose-free meals',
  ),
  FilterData(
    title: 'Vegan',
    subtitle: 'Only include vegan meals',
  ),
  FilterData(
    title: 'Vegetarian',
    subtitle: 'Only include vegetarian meals',
  ),
];

class FilterNotifier extends StateNotifier<List<FilterData>> {
  FilterNotifier() : super(initialState);

  // ignore: avoid_positional_boolean_parameters
  void setFilter(FilterData filter, bool isActive, int index) {
    FilterData newFilter = filter.copyWith(value: isActive);
    List<FilterData> newState = List.from(state);
    newState[index] = newFilter;
    state = newState;
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, List<FilterData>>((ref) {
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[0].value && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[1].value && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[2].value && !meal.isVegan) {
      return false;
    }
    if (activeFilters[3].value && !meal.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
