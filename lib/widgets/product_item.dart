import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Image.network(
              product.image,
              height: 200,
            ),
          ),
          Text(
            product.title,
            style: const TextStyle(color: Colors.grey),
          ),
          Row(
            children: const [
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Text(
            product.descrition,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Price:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(' \$${product.price}'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Row(
          //   children: [
          //     const Text(
          //       'Available items:',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     Text(' ${product.rating.count}'),
          //   ],
          // ),
          const SizedBox(
            height: 5,
          ),
          // Row(
          //   children: [
          //     const Text(
          //       'Rate:',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     Text(' ${product.rating.rate}'),
          //   ],
          // )
        ],
      ),
    );
  }
}
