import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:car_market/screens/catalog/catalog_screen.dart';
import 'package:car_market/screens/home/bloc/home_bloc.dart';
import 'package:car_market/screens/home/home_screen.dart';
import 'package:car_market/screens/product/bloc/product_bloc.dart';
import 'package:car_market/screens/product/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => HomeBloc()..add(const HomeInitEvent()),
          child: const HomeScreen(),
        ),
      ),
    ),
    GoRoute(
      name: 'catalog',
      path: '/catalog',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => CatalogBloc(mainRepository: GetIt.I<MainRepository>())..add(const CatalogInitEvent()),
          child: const CatalogScreen(),
        ),
      ),
    ),
    GoRoute(
      name: 'product',
      path: '/product',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BlocProvider(
          create: (context) => ProductBloc(mainRepository: GetIt.I<MainRepository>())..add(ProductInitEvent(vehicle: state.extra as VehicleModel)),
          child: const ProductScreen(),
        ),
      ),
    ),
  ],
);

class AppNavigation {
  static void back() => appRouter.pop();
  static void toHome() => appRouter.pushReplacement('/home');
  static void toCatalog() => appRouter.go('/catalog');
  static void toProduct(VehicleModel vehicle) => appRouter.go('/product', extra: vehicle);
}
