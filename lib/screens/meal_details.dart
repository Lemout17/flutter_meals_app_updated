import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/favorite_meals_cubit/favorite_meals_cubit.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          BlocBuilder<FavoriteMealsCubit, List<Meal>>(
            builder: (context, state) {
              final bool isFavorite = state.contains(meal);
              return IconButton(
                onPressed: () {
                  if (isFavorite) {
                    context.read<FavoriteMealsCubit>().removeFavoriteMeal(meal);
                    _showInfoMessage('Meal is no longer a favorite!', context);
                  } else {
                    context.read<FavoriteMealsCubit>().addFavoriteMeal(meal);
                    _showInfoMessage('Marked as a favorite!', context);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Steps',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showInfoMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
