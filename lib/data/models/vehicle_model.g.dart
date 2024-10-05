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
      driveType: json['driveType'] as String,
      energyConsumption: (json['energyConsumption'] as num).toDouble(),
      horsepower: (json['horsepower'] as num).toInt(),
      generation: json['generation'] as String,
      model: json['model'] as String,
      engine: json['engine'] as String,
      year: (json['year'] as num).toInt(),
      transmission: json['transmission'] as String,
      maxSpeed: (json['maxSpeed'] as num).toInt(),
      bodyType: json['bodyType'] as String,
      color: json['color'] as String,
      description: json['description'] as String,
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
      'driveType': instance.driveType,
      'energyConsumption': instance.energyConsumption,
      'horsepower': instance.horsepower,
      'generation': instance.generation,
      'model': instance.model,
      'engine': instance.engine,
      'year': instance.year,
      'transmission': instance.transmission,
      'maxSpeed': instance.maxSpeed,
      'bodyType': instance.bodyType,
      'color': instance.color,
      'description': instance.description,
    };
