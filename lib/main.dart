import 'package:car_market/car_market.dart';
import 'package:car_market/domain/config/di_initial.dart';
import 'package:flutter/material.dart';

void main() {
  diRegister();
  runApp(const CarMarket());
}
