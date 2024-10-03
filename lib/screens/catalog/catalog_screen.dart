import 'package:car_market/components/ui_const.dart';
import 'package:car_market/components/widgets/app_bar.dart';
import 'package:car_market/components/widgets/footer.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/screens/catalog/widgets/product_card.dart';
import 'package:car_market/screens/catalog/widgets/sort_dropdown.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppLocalization.catalogTitle),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SortDropdown(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true, // Ограничивает высоту GridView содержимым
                  physics: const NeverScrollableScrollPhysics(), // Отключает отдельное скроллирование для GridView
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 8.0, // Расстояние между строками
                      crossAxisSpacing: 8.0,
                      maxCrossAxisExtent: 350,
                      mainAxisExtent: 280.0 // Расстояние между колонками
                      ),
                  itemCount: 30, // Общее количество элементов
                  itemBuilder: (context, index) {
                    return ProductCardW();
                  },
                ),
              ),
              FooterW(),
            ],
          ),
        ),
      ),
    );
  }
}
