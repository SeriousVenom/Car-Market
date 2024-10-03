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

  VehicleModel({
    required this.serialNumber,
    required this.name,
    required this.exteriorColor,
    required this.quantity,
    required this.unitPriceCNY,
    required this.totalPriceCNY,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}

@JsonSerializable()
class VehicleListModel {
  final List<VehicleListModel> vehicles;

  VehicleListModel({required this.vehicles});

  factory VehicleListModel.fromJson(Map<String, dynamic> json) => _$VehicleListModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleListModelToJson(this);
}
