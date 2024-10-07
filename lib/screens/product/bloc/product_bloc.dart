import 'dart:developer';

import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_events.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  ProductBloc({required MainRepository mainRepository})
      : _mainRepository = mainRepository,
        super(const ProductState()) {
    on<ProductInitEvent>(_onInit);
    on<SwitchPurchaseType>(_onSwitchPurchaseType);
  }

  final MainRepository _mainRepository;

  Future<void> _onInit(ProductInitEvent event, Emitter<ProductState> emit) async {
    log('Product Init Event');
    log('Vehicle: ${event.vehicle}');
    emit(state.copyWith(vehicle: event.vehicle, status: ProductStatus.inProgress));
  }

  Future<void> _onSwitchPurchaseType(SwitchPurchaseType event, Emitter<ProductState> emit) async {
    log('Switch Purchase Type Event');
    emit(state.copyWith(status: ProductStatus.loading));
    emit(state.copyWith(purchaseType: event.purchaseType, status: ProductStatus.inProgress));
  }
}
