import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_events.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_onInit);
  }

  Future<void> _onInit(HomeInitEvent event, Emitter<HomeState> emit) async {
    log('Home Init Event');
  }
}
