import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/filters_bloc/filters_bloc.dart';
import 'package:flutter_meals_app_updated/widgets/switch_filter.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) => SwitchFilter(
              title: state.filterList[index].title,
              subtitle: state.filterList[index].subtitle,
              value: state.filterList[index].value,
              onChanged: (newValue) {
                context.read<FiltersBloc>().add(
                      AddFilterEvent(
                        filter: state.filterList[index],
                        value: newValue,
                      ),
                    );
              },
            ),
            itemCount: state.filterList.length,
          );
        },
      ),
    );
  }
}
