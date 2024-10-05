part of 'catalog_bloc.dart';

abstract class CatalogEvents extends Equatable {
  const CatalogEvents();
}

class CatalogInitEvent extends CatalogEvents {
  const CatalogInitEvent();

  @override
  List<Object?> get props => [];
}

class FilterByBrand extends CatalogEvents {
  const FilterByBrand({required this.brand});

  final String brand;

  @override
  List<Object?> get props => [brand];
}

class FilterByPriceRange extends CatalogEvents {
  const FilterByPriceRange({this.minPrice, this.maxPrice});

  final double? minPrice;
  final double? maxPrice;

  @override
  List<Object?> get props => [minPrice, maxPrice];
}

class SortingList extends CatalogEvents {
  const SortingList({required this.sortType});

  final SortType sortType;

  @override
  List<Object?> get props => [sortType];
}

class ResetFilters extends CatalogEvents {
  const ResetFilters();

  @override
  List<Object?> get props => [];
}
