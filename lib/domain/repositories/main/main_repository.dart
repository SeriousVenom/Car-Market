import 'package:car_market/data/models/vehicle_model.dart';

abstract class MainRepository {
  Future<List<VehicleModel>> getVehicleList();
}
