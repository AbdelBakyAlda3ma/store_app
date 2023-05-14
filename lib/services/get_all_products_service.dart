import 'package:store_app/helper/api_class.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    // http get method
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    // recieving the coming products in a list
    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    // returning the list of products
    return productList;
  }
}
