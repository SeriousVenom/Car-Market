import 'package:car_market/domain/config/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarMarket extends StatelessWidget {
  const CarMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
      ],
      // supportedLocales: [
      //   const Locale('en', 'US'),
      //   const Locale('ru', ''),
      // ],
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
