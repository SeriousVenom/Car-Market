part of 'home_bloc.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}

class HomeInitEvent extends HomeEvents {
  const HomeInitEvent();

  @override
  List<Object?> get props => [];
}
