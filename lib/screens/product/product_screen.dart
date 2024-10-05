import 'package:car_market/components/widgets/app_bar.dart';
import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:car_market/components/ui_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final VehicleModel vehicle;

  const ProductScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: vehicle.name,
        backButton: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vehicle Image and Info
              Center(
                child: Column(
                  children: [
                    Image.network(
                      vehicle.image,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "${vehicle.unitPriceCNY} ¥ - ${vehicle.totalPriceCNY} ¥",
                      style: AppTextStyles.boldStyle.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "${vehicle.description}",
                      style: AppTextStyles.mainStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              // Vehicle details
              _buildDetailsSection(),
              const SizedBox(height: 32.0),
              // Why choose us section
              _buildWhyChooseUsSection(),
              const SizedBox(height: 32.0),
              // Related Products
              _buildRelatedProductsSection(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Детали',
          style: AppTextStyles.boldStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16.0),
        _buildDetailRow('Привод', vehicle.driveType ?? '---'),
        _buildDetailRow('Потребление энергии', "${vehicle.energyConsumption ?? '---'} кВт/ч"),
        _buildDetailRow('Мощность', "${vehicle.horsepower ?? '---'} л.с."),
        _buildDetailRow('Поколение', vehicle.generation ?? '---'),
        _buildDetailRow('Модель', vehicle.model ?? '---'),
        _buildDetailRow('Двигатель', vehicle.engine ?? '---'),
        _buildDetailRow('Год', vehicle.year.toString() ?? '---'),
        _buildDetailRow('Коробка', vehicle.transmission ?? '---'),
        _buildDetailRow('Максимальная скорость', "${vehicle.maxSpeed ?? '---'} км/ч"),
        _buildDetailRow('Кузов', vehicle.bodyType ?? '---'),
        _buildDetailRow('Цвет', vehicle.color ?? '---'),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.mainStyle),
          Text(value, style: AppTextStyles.mainStyle),
        ],
      ),
    );
  }

  Widget _buildWhyChooseUsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Почему стоит покупать авто из Китая с нами',
          style: AppTextStyles.boldStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            IconWithTextWidget(
              icon: Icons.document_scanner,
              text: 'Официальный договор',
            ),
            IconWithTextWidget(
              icon: Icons.car_rental,
              text: 'Цены из Китая',
            ),
            IconWithTextWidget(
              icon: Icons.person,
              text: 'Фото в паспорте',
            ),
            IconWithTextWidget(
              icon: Icons.support_agent,
              text: 'Полное сопровождение',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRelatedProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Похожие товары',
          style: AppTextStyles.boldStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16.0),
        // Add related products here
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(vehicle.image, height: 100, fit: BoxFit.cover),
                const SizedBox(height: 8.0),
                Text(vehicle.name, style: AppTextStyles.mainStyle),
                Text("Цена: ${vehicle.unitPriceCNY} ¥"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IconWithTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32.0, color: Colors.black),
        const SizedBox(height: 8.0),
        Text(text, textAlign: TextAlign.center, style: AppTextStyles.mainStyle),
      ],
    );
  }
}
