class FilterData {
  final String title;
  final String subtitle;
  bool value;

  FilterData({
    required this.title,
    required this.subtitle,
    this.value = false,
  });
}
