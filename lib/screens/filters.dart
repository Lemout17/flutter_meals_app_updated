import 'package:flutter/material.dart';
import 'package:flutter_meals_app_updated/widgets/switch_filter.dart';
import '../models/filter_data.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<FilterData> _filtersList = [
    FilterData(
      title: 'Gluten - free',
      subtitle: 'Only include gluten-free meals',
    ),
    FilterData(
      title: 'Lactose - free',
      subtitle: 'Only include lactose-free meals',
    ),
    FilterData(
      title: 'Vegan',
      subtitle: 'Only include vegan meals',
    ),
    FilterData(
      title: 'Vegetarian',
      subtitle: 'Only include vegetarian meals',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filtersList[0].value = widget.currentFilters[Filter.glutenFree]!;
    _filtersList[1].value = widget.currentFilters[Filter.lactoseFree]!;
    _filtersList[2].value = widget.currentFilters[Filter.vegan]!;
    _filtersList[3].value = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _filtersList[0].value,
            Filter.lactoseFree: _filtersList[1].value,
            Filter.vegan: _filtersList[2].value,
            Filter.vegetarian: _filtersList[3].value,
          });

          return false;
        },
        child: ListView.builder(
          itemBuilder: (context, index) => SwitchFilter(
            title: _filtersList[index].title,
            subtitle: _filtersList[index].subtitle,
            value: _filtersList[index].value,
            onChanged: (newValue) {
              setState(() {
                _filtersList[index].value = newValue;
              });
            },
          ),
          itemCount: _filtersList.length,
        ),
      ),
    );
  }
}
