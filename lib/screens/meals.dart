import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/favorite_meals_cubit/favorite_meals_cubit.dart';
import 'package:flutter_meals_app_updated/blocs/filtered_meals/filtered_meals_cubit.dart';
import 'package:flutter_meals_app_updated/screens/meal_details.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final bool isFavorite;

  const MealsScreen({
    super.key,
    this.title,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isFavorite) {
      return BlocBuilder<FavoriteMealsCubit, List<Meal>>(
        builder: (context, state) {
          return _buildBody(context, state);
        },
      );
    }

    return BlocBuilder<FilteredMealsCubit, List<Meal>>(
      builder: (context, state) {
        return _buildBody(context, state);
      },
    );
  }

  Widget _buildEmptyPage(ThemeData theme) {
    return Center(
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

  Widget _buildBody(BuildContext context, List<Meal> meals) {
    final ThemeData theme = Theme.of(context);
    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: selectMeal,
      ),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      content = _buildEmptyPage(theme);
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
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
