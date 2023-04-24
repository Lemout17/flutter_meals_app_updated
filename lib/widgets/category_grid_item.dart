import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final VoidCallback onSelectCategory;
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onSelectCategory,
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
