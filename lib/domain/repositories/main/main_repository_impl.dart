import 'dart:convert';
import 'dart:developer';

import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/repositories/main/main_repository.dart';
import 'package:car_market/generated/assets.dart';
import 'package:flutter/services.dart';

class MainRepositoryImpl implements MainRepository {
  @override
  Future<List<VehicleModel>> getVehicleList() async {
    try {
      var response = await rootBundle.loadString(Assets.dataVehicles);
      Map<String, dynamic> jsonMap = jsonDecode(response);
      List<dynamic> data = jsonMap['vehicles'];
      List<VehicleModel> vehicleList = data.map((e) => VehicleModel.fromJson(e)).toList();
      return vehicleList;
    } catch (e) {
      throw Exception('Не удалось загрузить список автомобилей: $e');
    }
  }
}
