part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddMealToCart extends CartEvent {
  final Meal meal;

  const AddMealToCart(this.meal);
}

class RemoveMealFromCart extends CartEvent {
  final Meal meal;

  const RemoveMealFromCart(this.meal);
}
