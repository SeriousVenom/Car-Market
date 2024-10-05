part of 'product_bloc.dart';

abstract class ProductEvents extends Equatable {
  const ProductEvents();
}

class ProductInitEvent extends ProductEvents {
  const ProductInitEvent();

  @override
  List<Object?> get props => [];
}
