part of 'product_bloc.dart';

enum ProductStatus { loading, inProgress, failure }

final class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.loading,
    this.vehicle,
    this.purchaseType = PurchaseType.onUs,
  });

  final ProductStatus status;
  final VehicleModel? vehicle;
  final PurchaseType purchaseType;

  ProductState copyWith({
    ProductStatus? status,
    VehicleModel? vehicle,
    PurchaseType? purchaseType,
  }) {
    return ProductState(
      status: status ?? this.status,
      vehicle: vehicle ?? this.vehicle,
      purchaseType: purchaseType ?? this.purchaseType,
    );
  }

  @override
  List<Object?> get props => [status, vehicle, purchaseType];
}

enum PurchaseType {
  onUs('За наш счет'),
  onYou('За ваш счет');

  final String title;
  const PurchaseType(this.title);
}
