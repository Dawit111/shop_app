import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/shop.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/landing_page.dart';
import 'package:shop_app/pages/shop_page.dart';
import 'package:shop_app/theme/mode.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      theme: Provider.of<Shop>(context).themeData,
      routes: {
        '/landingPage': (context) => LandingPage(),
        '/shopPage': (context) => ShopPage(),
        '/cartPage': (context) => CartPage(),
      },
    );
  }
}
