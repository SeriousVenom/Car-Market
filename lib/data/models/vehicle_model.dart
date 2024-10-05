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

  VehicleModel({
    required this.serialNumber,
    required this.name,
    required this.exteriorColor,
    required this.quantity,
    required this.unitPriceCNY,
    required this.totalPriceCNY,
    required this.image,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
