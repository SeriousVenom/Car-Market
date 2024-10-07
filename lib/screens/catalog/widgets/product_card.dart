import 'package:car_market/components/ui_const.dart';
import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/domain/config/navigation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProductCardW extends StatelessWidget {
  const ProductCardW({super.key, required this.vehicle});

  final VehicleModel vehicle;

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: ResponsiveValue<double>(
                      context,
                      defaultValue: 150.0,
                      conditionalValues: [
                        Condition.smallerThan(name: MOBILE, value: 120.0),
                        Condition.largerThan(name: DESKTOP, value: 200.0),
                      ],
                    ).value!,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        vehicle.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Text('${vehicle.totalPriceCNY} ¥', style: AppTextStyles.boldStyle),
                  Text(vehicle.name, style: AppTextStyles.mainStyle),
                  const SizedBox(height: 12.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => AppNavigation.toProduct(vehicle),
                      child: const Text(AppLocalization.makeOrder),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
