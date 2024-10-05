part of 'catalog_bloc.dart';

enum CatalogStatus { loading, inProgress, success, failure }

enum SortType {
  defaultOrder('По наименованию'),
  priceAscending('По цене: от низкой к высокой'),
  priceDescending('По цене: от высокой к низкой');

  final String title;
  const SortType(this.title);
}

final class CatalogState extends Equatable {
  const CatalogState({
    this.vehicleList = const [],
    this.filteredVehicleList = const [],
    this.status = CatalogStatus.loading,
    this.brandList = const [],
    this.listSort = SortType.defaultOrder,
    this.currentFilterBrand = 'Все бренды',
    this.filterMinPrice = 0,
    this.filterMaxPrice = 0,
  });

  final List<VehicleModel> vehicleList;
  final List<VehicleModel> filteredVehicleList;
  final CatalogStatus status;
  final List<String> brandList;
  final SortType listSort;
  final String currentFilterBrand;
  final double filterMinPrice;
  final double filterMaxPrice;

  CatalogState copyWith({
    List<VehicleModel>? vehicleList,
    List<VehicleModel>? filteredVehicleList,
    CatalogStatus? status,
    List<String>? brandList,
    SortType? listSort,
    String? currentFilterBrand,
    double? filterMinPrice,
    double? filterMaxPrice,
  }) {
    return CatalogState(
      vehicleList: vehicleList ?? this.vehicleList,
      filteredVehicleList: filteredVehicleList ?? this.filteredVehicleList,
      status: status ?? this.status,
      brandList: brandList ?? this.brandList,
      listSort: listSort ?? this.listSort,
      currentFilterBrand: currentFilterBrand ?? this.currentFilterBrand,
      filterMinPrice: filterMinPrice ?? this.filterMinPrice,
      filterMaxPrice: filterMaxPrice ?? this.filterMaxPrice,
    );
  }

  @override
  List<Object?> get props => [
        vehicleList,
        filteredVehicleList,
        status,
        brandList,
        listSort,
        currentFilterBrand,
        filterMinPrice,
        filterMaxPrice,
      ];
}
