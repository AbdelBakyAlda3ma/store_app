import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = "UpdateProductPage";
  const UpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    String? title;
    String? price;
    String? description;
    String? image;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Update Product Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              onChange: (data) {
                title = data;
              },
              labelText: "Product title",
              hintText: 'Enter product title',
            ),
            CustomTextField(
              onChange: (data) {
                price = data;
              },
              labelText: "Product price",
              hintText: 'Enter product price',
            ),
            CustomTextField(
              onChange: (data) {
                image = data;
              },
              labelText: 'Product image URL',
              hintText: 'You better copy and past URL',
            ),
            CustomTextField(
              onChange: (data) {
                description = data;
              },
              labelText: 'Product description',
              hintText: 'Enter product description',
            ),
            CustomButton(onTab: () async {
              await updateProduct(product, title, price, description, image);
              try {} catch (e) {
                log(e.toString());
              }
              if (context.mounted) Navigator.of(context).pop();
            }),
          ],
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product, String? title, String? price,
      String? description, String? image) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: title ?? product.title,
        price: price ?? product.price,
        description: description ?? product.descrition,
        image: image ?? product.image,
        category: product.category);
  }
}
