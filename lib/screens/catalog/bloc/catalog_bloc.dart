import 'dart:developer';

import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_market/data/models/vehicle_model.dart';

part 'catalog_events.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvents, CatalogState> {
  CatalogBloc({required MainRepository mainRepository})
      : _mainRepository = mainRepository,
        super(const CatalogState()) {
    on<CatalogInitEvent>(_onInit);
    on<FilterByBrand>(_filterByBrand);
    on<FilterByPriceRange>(_onFilterByPriceRange);
    on<SortingList>(_onSortingList);
    on<ResetFilters>(_onResetFilters);
  }

  final MainRepository _mainRepository;

  Future<void> _onInit(CatalogInitEvent event, Emitter<CatalogState> emit) async {
    log('Catalog Init Event');
    List<VehicleModel> vehicleList = await _mainRepository.getVehicleList();
    List<String> brands = extractUniqueBrands(vehicleList);
    brands.add('Все бренды');
    log('Brands: $brands');
    vehicleList.sort((a, b) => a.name.compareTo(b.name));
    emit(state.copyWith(vehicleList: vehicleList, brandList: brands, status: CatalogStatus.inProgress, filteredVehicleList: vehicleList));
  }

  Future<void> _filterByBrand(FilterByBrand event, Emitter<CatalogState> emit) async {
    log('Filter by brand Event');
    emit(state.copyWith(status: CatalogStatus.loading));

    if (event.brand == 'Все бренды') {
      emit(state.copyWith(filteredVehicleList: state.vehicleList, status: CatalogStatus.inProgress));
    } else {
      emit(state.copyWith(status: CatalogStatus.loading, filteredVehicleList: state.vehicleList));
      List<VehicleModel> filteredVehicles = state.vehicleList.where((vehicle) => vehicle.name.split(' ')[0] == event.brand).toList();
      emit(state.copyWith(filteredVehicleList: filteredVehicles, status: CatalogStatus.inProgress));
    }
  }

  Future<void> _onFilterByPriceRange(FilterByPriceRange event, Emitter<CatalogState> emit) async {
    log('Filter by price Event');
    emit(state.copyWith(status: CatalogStatus.loading));

    if (event.minPrice == null && event.maxPrice == null) {
      emit(state.copyWith(filteredVehicleList: state.vehicleList, status: CatalogStatus.inProgress));
    }

    List<VehicleModel> filteredVehicles = state.filteredVehicleList.where((vehicle) {
      bool isAboveMin = event.minPrice == null || vehicle.unitPriceCNY >= event.minPrice!;
      bool isBelowMax = event.maxPrice == null || vehicle.unitPriceCNY <= event.maxPrice!;
      return isAboveMin && isBelowMax;
    }).toList();
    emit(state.copyWith(filteredVehicleList: filteredVehicles, status: CatalogStatus.inProgress));
  }

  Future<void> _onSortingList(SortingList event, Emitter<CatalogState> emit) async {
    log('Sorting list Event');
    emit(state.copyWith(status: CatalogStatus.loading));
    switch (event.sortType) {
      case SortType.defaultOrder:
        state.vehicleList.sort((a, b) => a.name.compareTo(b.name));
        emit(state.copyWith(filteredVehicleList: state.vehicleList, status: CatalogStatus.inProgress));
        break;
      case SortType.priceAscending:
        state.filteredVehicleList.sort((a, b) => a.unitPriceCNY.compareTo(b.unitPriceCNY));
        emit(state.copyWith(filteredVehicleList: state.filteredVehicleList, status: CatalogStatus.inProgress));
        break;
      case SortType.priceDescending:
        state.filteredVehicleList.sort((a, b) => b.unitPriceCNY.compareTo(a.unitPriceCNY));
        emit(state.copyWith(filteredVehicleList: state.filteredVehicleList, status: CatalogStatus.inProgress));
        break;
    }
  }

  Future<void> _onResetFilters(ResetFilters event, Emitter<CatalogState> emit) async {
    log('Reset filters Event');
    emit(state.copyWith(status: CatalogStatus.loading));
    emit(
      state.copyWith(
        filteredVehicleList: state.vehicleList,
        currentFilterBrand: 'Все бренды',
        filterMinPrice: null,
        filterMaxPrice: null,
        listSort: SortType.defaultOrder,
        status: CatalogStatus.inProgress,
      ),
    );
    log('Brand: ${state.currentFilterBrand}, Min Price: ${state.filterMinPrice}, Max Price: ${state.filterMaxPrice}, Sort: ${state.listSort}');
  }

  List<String> extractUniqueBrands(List<VehicleModel> vehicles) {
    return vehicles.map((vehicle) => vehicle.name.split(' ')[0]).toSet().toList();
  }
}
