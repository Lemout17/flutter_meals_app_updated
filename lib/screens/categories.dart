import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/filtered_meals/filtered_meals_cubit.dart';
import 'package:flutter_meals_app_updated/blocs/filters_bloc/filters_bloc.dart';

import '../data/data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../screens/meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> categorisedMeals = Constants.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => FilteredMealsCubit(
            filteredBloc: context.read<FiltersBloc>(),
            meals: categorisedMeals,
          ),
          child: MealsScreen(
            title: category.title,
          ),
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
