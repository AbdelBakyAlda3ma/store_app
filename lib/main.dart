import 'package:flutter/material.dart';
import 'package:store_app/screens/favorites_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/product_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        FavoriteProductsPage.id: (context) => const FavoriteProductsPage(),
        ProductPage.id: (context) => const ProductPage(),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
