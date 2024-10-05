import 'package:car_market/components/ui_const.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:flutter/material.dart';

class ProductCardW extends StatelessWidget {
  const ProductCardW({super.key, required this.title, required this.price, required this.image});

  final String title;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Text('$price ¥', style: AppTextStyles.boldStyle),
            Text(title, style: AppTextStyles.mainStyle),
            //Отзывы и рейтинг - оставить на потом
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Icon(
            //       Icons.star,
            //       size: 12.0,
            //       color: Colors.orange,
            //     ),
            //     Text('5'),
            //     Text(' • 3 отзыва'),
            //   ],
            // ),
            const SizedBox(height: 12.0),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(AppLocalization.makeOrder),
              ),
            )
          ],
        ),
      ),
    );
  }
}
