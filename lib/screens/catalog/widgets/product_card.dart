import 'package:car_market/components/ui_const.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:flutter/material.dart';

class ProductCardW extends StatelessWidget {
  const ProductCardW({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network('https://imgd.aeplcdn.com/600x337/n/cw/ec/139651/curvv-exterior-right-front-three-quarter.jpeg?isig=0&q=80'),
            Text('251781 ¥', style: AppTextStyles.boldStyle),
            Text('BYD Song L EV', style: AppTextStyles.mainStyle),
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
                child: Text(AppLocalization.makeOrder),
              ),
            )
          ],
        ),
      ),
    );
  }
}
