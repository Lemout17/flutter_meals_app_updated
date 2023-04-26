import 'package:flutter/material.dart';
import 'package:flutter_meals_app_updated/models/filter_data.dart';
import 'package:flutter_meals_app_updated/providers/filters_provider.dart';
import 'package:flutter_meals_app_updated/widgets/switch_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: ListView.builder(
        itemBuilder: (context, index) => SwitchFilter(
          title: activeFilters[index].title,
          subtitle: activeFilters[index].subtitle,
          value: activeFilters[index].value,
          onChanged: (newValue) =>
              _onChanged(newValue, activeFilters[index], index, ref),
        ),
        itemCount: activeFilters.length,
      ),
    );
  }

  void _onChanged(bool newValue, FilterData filter, int index, WidgetRef ref) {
    ref.read(filtersProvider.notifier).setFilter(filter, newValue, index);
  }
}
