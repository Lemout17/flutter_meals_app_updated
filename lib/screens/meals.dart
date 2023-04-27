import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/filters_bloc/filters_bloc.dart';
import 'package:flutter_meals_app_updated/data/data.dart';
import 'package:flutter_meals_app_updated/models/filter_data.dart';
import 'package:flutter_meals_app_updated/screens/meal_details.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  final String? title;
  final List<Meal> meals;

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late final List<Meal> _filteredMeals;

  @override
  void initState() {
    super.initState();
    final List<FilterData> filterData =
        context.read<FiltersBloc>().state.filterList;

    _filteredMeals = widget.meals.where((meal) {
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
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: _filteredMeals[index],
        onSelectMeal: selectMeal,
      ),
      itemCount: _filteredMeals.length,
    );

    if (_filteredMeals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            )
          ],
        ),
      );
    }

    if (widget.title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: content,
    );
  }

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }
}
