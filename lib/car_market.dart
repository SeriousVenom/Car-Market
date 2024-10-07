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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // supportedLocales: [
      //   const Locale('en', 'US'),
      //   const Locale('ru', ''),
      // ],
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
