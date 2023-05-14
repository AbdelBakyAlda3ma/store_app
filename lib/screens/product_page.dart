import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product_item.dart';

class ProductPage extends StatelessWidget {
  static String id = 'ProductPage';
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Product Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ProductItem(
        product: product,
      ),
    );
  }
}
