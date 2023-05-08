import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/bloc/cart_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/favorite_meals_cubit/favorite_meals_cubit.dart';
import 'package:flutter_meals_app_updated/widgets/info_message.dart';
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
    // bool isInCart = context.read<CartCubit>().state.contains(meal);
    bool isInCart = context.read<CartBloc>().state.listOfMeals.contains(meal);

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
                    InfoMessage().showInfoMessage(
                      'Meal is no longer a favorite!',
                      context,
                    );
                  } else {
                    context.read<FavoriteMealsCubit>().addFavoriteMeal(meal);
                    InfoMessage()
                        .showInfoMessage('Marked as a favorite!', context);
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
            Container(
              color: theme.colorScheme.background.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  for (final step in meal.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (isInCart) {
          //   context.read<CartCubit>().removeMealToCart(meal);
          //   _showInfoMessage('Meal is removed from cart!', context);
          // } else {
          //   context.read<CartCubit>().addMealToCart(meal);
          //   _showInfoMessage('Meal is added to cart!', context);
          // }

          if (isInCart) {
            context.read<CartBloc>().add(RemoveMealFromCart(meal));
            InfoMessage().showInfoMessage(
              '${meal.title} is removed from cart!',
              context,
            );
          } else {
            context.read<CartBloc>().add(AddMealToCart(meal));
            InfoMessage()
                .showInfoMessage('${meal.title} is added to cart!', context);
          }
        },
        backgroundColor: theme.colorScheme.onSecondary,
        foregroundColor: theme.colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Icon(isInCart ? Icons.remove : Icons.add),
      ),
    );
  }
}
