import 'package:flutter/material.dart';
import 'package:store_app/functions/go_to_page_function.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_page.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatefulWidget {
  final ProductModel product;
  final List<ProductModel>? favoriteProductsList;
  const CustomCard(
      {super.key, required this.product, this.favoriteProductsList});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with AutomaticKeepAliveClientMixin {
  MaterialColor color = Colors.grey;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onLongPress: () => goTo(
        context: context,
        routeName: UpdateProductPage.id,
        arguments: widget.product,
      ),
      onTap: () => goTo(
          context: context,
          routeName: ProductPage.id,
          arguments: widget.product),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.20),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ]),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.product.title.substring(0, 7),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.product.price}',
                          ),
                          IconButton(
                              onPressed: () {
                                if (widget.product.isFavourite) {
                                  widget.product.isFavourite = false;
                                  widget.favoriteProductsList!
                                      .remove(widget.product);

                                  setState(() {
                                    color = Colors.grey;
                                  });
                                } else {
                                  widget.product.isFavourite = true;
                                  widget.favoriteProductsList!
                                      .add(widget.product);
                                  setState(() {
                                    color = Colors.red;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: color,
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: -40,
            child: Image.network(
              widget.product.image,
              height: 120,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
