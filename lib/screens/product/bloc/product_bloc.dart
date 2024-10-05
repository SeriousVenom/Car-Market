import 'dart:developer';

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
  }

  final MainRepository _mainRepository;

  Future<void> _onInit(ProductInitEvent event, Emitter<ProductState> emit) async {
    log('Product Init Event');
  }
}
