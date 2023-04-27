import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/data/data.dart';
import 'package:flutter_meals_app_updated/models/filter_data.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(const FilterDataState(Constants.filtersList)) {
    on<AddFilterEvent>(_onAddFilterEvent);
  }

  FutureOr<void> _onAddFilterEvent(
    AddFilterEvent event,
    Emitter<FiltersState> emit,
  ) {
    FilterData newFilter = event.filter.copyWith(value: event.value);
    List<FilterData> newList = List.from(state.filterList);
    final int index = newList.indexOf(event.filter);
    newList[index] = newFilter;
    emit(FilterDataState(newList));
  }
}
