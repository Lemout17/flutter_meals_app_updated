class FilterData {
  final String title;
  final String subtitle;
  final bool value;

  FilterData({
    required this.title,
    required this.subtitle,
    this.value = false,
  });

  FilterData copyWith({bool? value}) {
    return FilterData(
      title: title,
      subtitle: subtitle,
      value: value ?? this.value,
    );
  }
}
