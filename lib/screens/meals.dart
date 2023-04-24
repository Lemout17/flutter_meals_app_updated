import 'package:flutter/material.dart';
import 'package:flutter_meals_app_updated/screens/meal_details.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: selectMeal,
      ),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
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
}
