import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../screens/meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> filteredMeals;
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.filteredMeals,
  });

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> categorisedMeals = filteredMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: categorisedMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...Constants.availableCategories
            .map(
              (category) => CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ),
            )
            .toList()
      ],
    );
  }
}
