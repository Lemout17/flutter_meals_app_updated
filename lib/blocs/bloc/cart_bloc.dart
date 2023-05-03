import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/meal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const DataListOfMeals([])) {
    on<AddMealToCart>(_onAddMealToCart);
    on<RemoveMealFromCart>(_onRemoveMealFromCart);
  }

  FutureOr<void> _onAddMealToCart(
    AddMealToCart event,
    Emitter<CartState> emit,
  ) {
    List<Meal> newList = List.from(state.listOfMeals);
    newList.add(event.meal);
    emit(DataListOfMeals(newList));
  }

  FutureOr<void> _onRemoveMealFromCart(
    RemoveMealFromCart event,
    Emitter<CartState> emit,
  ) {
    List<Meal> newList = List.from(state.listOfMeals);
    newList.remove(event.meal);
    emit(DataListOfMeals(newList));
  }
}
