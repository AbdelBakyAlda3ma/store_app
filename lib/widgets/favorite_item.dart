import 'package:flutter/material.dart';
import 'package:store_app/functions/go_to_page_function.dart';
import 'package:store_app/screens/product_page.dart';

import '../models/product_model.dart';

class FavoriteItem extends StatelessWidget {
  final ProductModel productModel;
  const FavoriteItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goTo(
          context: context, routeName: ProductPage.id, arguments: productModel),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                productModel.image,
                height: 200,
              ),
            ),
            Text(
              productModel.title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Text(
            //       "Rate: ${productModel.rating.rate}",
            //       style: const TextStyle(fontSize: 20),
            //     ),
            //     Text(
            //       "Available items : ${productModel.rating.count}",
            //       style: const TextStyle(fontSize: 20),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
