import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/cart_cubit/cart_cubit.dart';
import 'package:flutter_meals_app_updated/models/meal.dart';
import 'package:flutter_meals_app_updated/screens/meal_details.dart';
import 'package:flutter_meals_app_updated/widgets/meal_item.dart';

class CartScreen extends StatelessWidget {
  final String? title;
  const CartScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<CartCubit, List<Meal>>(
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
            'Your cart is empty',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try to add some meals!',
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
        isCartPage: true,
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
