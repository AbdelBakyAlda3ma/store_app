import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/favorites_page.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> allProductList = [];
    List<ProductModel> favoriteProductList = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                FavoriteProductsPage.id,
                arguments: favoriteProductList,
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.update,
                color: Colors.black,
              )),
        ],
      ),
      body: FutureBuilder(
        future: GetAllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var i = 0; i < snapshot.data!.length; i++) {
              allProductList.add(snapshot.data![i]);
            }
            return Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 10,
                right: 10,
              ),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 70,
                ),
                itemCount: allProductList.length,
                itemBuilder: (context, index) => CustomCard(
                  product: allProductList[index],
                  favoriteProductsList: favoriteProductList,
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
