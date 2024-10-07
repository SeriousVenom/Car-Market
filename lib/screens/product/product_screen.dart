import 'package:car_market/components/widgets/app_bar.dart';
import 'package:car_market/components/widgets/footer.dart';
import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/generated/assets.dart';
import 'package:car_market/screens/product/bloc/product_bloc.dart';
import 'package:car_market/screens/product/widgets/purchase_type.dart';
import 'package:flutter/material.dart';
import 'package:car_market/components/ui_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Scaffold(
        appBar: MainAppBar(
          title: state.vehicle?.name ?? '',
          backButton: true,
        ),
        body: switch (state.status) {
          ProductStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          ProductStatus.inProgress => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 128.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 64.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ImageGalleryWidget(),
                      const SizedBox(width: 24.0),
                      ProductDescriptionW(),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${state.vehicle?.totalPriceCNY} ¥',
                                        style: AppTextStyles.boldStyle.copyWith(fontSize: 18.0),
                                      ),
                                      const SizedBox(width: 8.0),
                                      const PurchaseTypeChoiceW(),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(
                                      state.purchaseType == PurchaseType.onUs ? AppLocalization.makeOrderByUs : AppLocalization.makeOrderByYou,
                                      style: AppTextStyles.mainStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      AppLocalization.makeOrder,
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ProductStatus.failure => const Center(
              child: Text('Error'),
            ),
        },
      );
    });
  }
}

class PurchasingProcessW extends StatelessWidget {
  const PurchasingProcessW({
    super.key,
    required this.carTitle,
  });

  final String carTitle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(12.0)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Процесс покупки $carTitle из Китая\n', style: AppTextStyles.boldStyle),
                const TextSpan(text: '1. Заключаем официальный договор на услугу подбора авто;\n'),
                const TextSpan(text: '2. Подбираем автомобиль с учетом выбранных вами критериев\n (характеристик) и бюджета; \n'),
                const TextSpan(text: '3. Выкупаем авто;\n'),
                const TextSpan(text: '4. В зависимости от способа покупки доставляем вам авто;\n'),
                const TextSpan(text: '5. Доставляем машину в Россию;\n'),
                const TextSpan(text: '6. Поздравляем — вы владелец нового авто из Китая!\n'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDescriptionW extends StatelessWidget {
  const ProductDescriptionW({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.black, width: 1.5), borderRadius: BorderRadius.circular(12.0)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectableText.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Модель автомобиля\n'),
                    const TextSpan(text: 'Модельный год\n'),
                    const TextSpan(text: 'Двигатель\n'),
                    const TextSpan(text: 'Объем двигателя (л)\n'),
                    const TextSpan(text: 'Мощность двигателя (л.с.)\n'),
                    const TextSpan(text: 'КПП\n'),
                  ],
                ),
              ),
              const SizedBox(width: 18.0),
              SelectableText.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Tiggo 4 Pro\n'),
                    const TextSpan(text: '2024\n'),
                    const TextSpan(text: 'бензин\n'),
                    const TextSpan(text: '1.5\n'),
                    const TextSpan(text: '113 лс\n'),
                    const TextSpan(text: 'механическая\n'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageGalleryWidget extends StatefulWidget {
  const ImageGalleryWidget({super.key});

  @override
  State<ImageGalleryWidget> createState() => _ImageGalleryWidgetState();
}

class _ImageGalleryWidgetState extends State<ImageGalleryWidget> {
  int _selectedImageIndex = 0;

  final List<String> _images = [
    Assets.imagesBenzEQA,
    Assets.imagesBMWIX1,
    Assets.imagesLiL6,
    Assets.imagesVWID4X,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Opacity(
                        opacity: _selectedImageIndex == index ? 1.0 : 0.7,
                        child: SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(_images[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                height: 400,
                width: 550,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    _images[_selectedImageIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
