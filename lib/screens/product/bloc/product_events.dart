part of 'product_bloc.dart';

abstract class ProductEvents extends Equatable {
  const ProductEvents();
}

class ProductInitEvent extends ProductEvents {
  const ProductInitEvent({required this.vehicle});
  final VehicleModel vehicle;
  @override
  List<Object?> get props => [vehicle];
}

class SwitchPurchaseType extends ProductEvents {
  const SwitchPurchaseType({required this.purchaseType});
  final PurchaseType purchaseType;
  @override
  List<Object?> get props => [purchaseType];
}
