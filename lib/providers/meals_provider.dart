import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';

final mealsProvider = Provider((ref) {
  return Constants.availableMeals;
});
