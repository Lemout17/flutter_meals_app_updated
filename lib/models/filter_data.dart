import 'package:equatable/equatable.dart';
import 'package:flutter_meals_app_updated/data/data.dart';

class FilterData extends Equatable {
  final String title;
  final String subtitle;
  final bool value;
  final Filter filter;

  const FilterData({
    required this.filter,
    required this.title,
    required this.subtitle,
    this.value = false,
  });

  FilterData copyWith({required bool value}) {
    return FilterData(
      filter: filter,
      title: title,
      subtitle: subtitle,
      value: value,
    );
  }

  @override
  List<Object?> get props => [filter, title, subtitle, value];
}
