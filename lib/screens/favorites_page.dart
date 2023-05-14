import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/favorite_item.dart';

class FavoriteProductsPage extends StatefulWidget {
  static String id = 'FavoriteProductsPage';
  const FavoriteProductsPage({super.key});

  @override
  State<FavoriteProductsPage> createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> favoriteProductList =
        ModalRoute.of(context)!.settings.arguments as List<ProductModel>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorite Products',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: favoriteProductList.isEmpty
          ? const Center(
              child: Text('there is any favorite products'),
            )
          : ListView.builder(
              itemCount: favoriteProductList.length,
              itemBuilder: (context, index) {
                return FavoriteItem(productModel: favoriteProductList[index]);
              }),
    );
  }
}
