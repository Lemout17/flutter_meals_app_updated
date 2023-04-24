import 'package:flutter/material.dart';

class SwitchFilter extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchFilter({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.labelMedium!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      activeColor: theme.colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
