import 'package:car_market/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseTypeChoiceW extends StatefulWidget {
  const PurchaseTypeChoiceW({super.key});

  @override
  State<PurchaseTypeChoiceW> createState() => _PurchaseTypeChoiceWState();
}

class _PurchaseTypeChoiceWState extends State<PurchaseTypeChoiceW> {
  PurchaseType _purchaseType = PurchaseType.onUs;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<PurchaseType>(
            focusColor: Colors.transparent,
            value: _purchaseType,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: PurchaseType.values.map((PurchaseType items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items.title),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _purchaseType = newValue!;
              });
              context.read<ProductBloc>().add(SwitchPurchaseType(purchaseType: _purchaseType));
            },
          ),
        ),
      ),
    );
  }
}
