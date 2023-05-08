import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/bloc/cart_bloc.dart';
import 'package:flutter_meals_app_updated/widgets/info_message.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import '../widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  final bool isCartPage;
  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
    this.isCartPage = false,
  });

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectMeal(context, meal),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              top: 5,
              right: 5,
              child: isCartPage ? _buildIconButton(context) : Container(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.7)),
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.9),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: InkWell(
          onTap: () {
            // context.read<CartCubit>().removeMealToCart(meal);
            context.read<CartBloc>().add(RemoveMealFromCart(meal));
            InfoMessage().showInfoMessage(
                '${meal.title} is removed from cart!', context);
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.remove,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
