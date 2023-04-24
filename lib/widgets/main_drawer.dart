import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;
  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Widget buildListTile(IconData icon, String title, String route) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: theme.colorScheme.onBackground,
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onBackground,
            fontSize: 24,
          ),
        ),
        onTap: () {
          onSelectScreen(route);
        },
      );
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 46,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          buildListTile(Icons.restaurant, 'Meals', 'meals'),
          buildListTile(Icons.settings, 'Filters', 'filters'),
        ],
      ),
    );
  }
}
