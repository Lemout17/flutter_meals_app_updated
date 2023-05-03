part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final List<Meal> listOfMeals;
  const CartState(this.listOfMeals);

  @override
  List<Object> get props => [listOfMeals];
}

class DataListOfMeals extends CartState {
  const DataListOfMeals(super.listOfMeals);
}
