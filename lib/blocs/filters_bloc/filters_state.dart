part of 'filters_bloc.dart';

abstract class FiltersState {
  final List<FilterData> filterList;

  const FiltersState(this.filterList);
}

class FilterDataState extends FiltersState {
  const FilterDataState(super.filterList);
}
