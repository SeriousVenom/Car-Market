// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      serialNumber: (json['serialNumber'] as num).toInt(),
      name: json['name'] as String,
      exteriorColor: json['exteriorColor'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPriceCNY: (json['unitPriceCNY'] as num).toInt(),
      totalPriceCNY: (json['totalPriceCNY'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'serialNumber': instance.serialNumber,
      'name': instance.name,
      'exteriorColor': instance.exteriorColor,
      'quantity': instance.quantity,
      'unitPriceCNY': instance.unitPriceCNY,
      'totalPriceCNY': instance.totalPriceCNY,
      'image': instance.image,
    };
