import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:car_market/domain/repositories/main/main_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void diRegister() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  // final NetworkService networkService = NetworkService(secureStorage: secureStorage);
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  GetIt.I.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(),
  );
}
