import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  final int serialNumber;
  final String name;
  final String exteriorColor;
  final int quantity;
  final int unitPriceCNY;
  final int totalPriceCNY;
  final String image;
  final String driveType;
  final double energyConsumption;
  final int horsepower;
  final String generation;
  final String model;
  final String engine;
  final int year;
  final String transmission;
  final int maxSpeed;
  final String bodyType;
  final String color;
  final String description;

  VehicleModel({
    required this.serialNumber,
    required this.name,
    required this.exteriorColor,
    required this.quantity,
    required this.unitPriceCNY,
    required this.totalPriceCNY,
    required this.image,
    required this.driveType,
    required this.energyConsumption,
    required this.horsepower,
    required this.generation,
    required this.model,
    required this.engine,
    required this.year,
    required this.transmission,
    required this.maxSpeed,
    required this.bodyType,
    required this.color,
    required this.description,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
