part of 'filters_bloc.dart';

abstract class FiltersEvent {
  const FiltersEvent();
}

class AddFilterEvent extends FiltersEvent {
  final FilterData filter;
  final bool value;

  const AddFilterEvent({
    required this.filter,
    required this.value,
  });
}
