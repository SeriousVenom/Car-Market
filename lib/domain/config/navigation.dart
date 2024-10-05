import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:car_market/screens/catalog/catalog_screen.dart';
import 'package:car_market/screens/home/bloc/home_bloc.dart';
import 'package:car_market/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc()..add(const HomeInitEvent()),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      name: 'catalog',
      path: '/catalog',
      builder: (context, state) => BlocProvider(
        create: (context) => CatalogBloc(mainRepository: GetIt.I<MainRepository>())..add(const CatalogInitEvent()),
        child: const CatalogScreen(),
      ),
    ),
    // GoRoute(
    //   name: 'auth',
    //   path: '/auth',
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => AuthBloc(
    //       authRepository: GetIt.I<AuthRepository>(),
    //     ),
    //     child: const AuthScreen(),
    //   ),
    // ),
  ],
);

class AppNavigation {
  static void back() => appRouter.pop();
  static void toHome() => appRouter.pushReplacement('/home');
  static void toCatalog() => appRouter.push('/catalog');
}
