import 'package:store_app/models/product_model.dart';
import 'package:store_app/helper/api_class.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategorisedProduct(
      {required String categoryName}) async {
    // http get method
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    // recieving the coming products in a list
    List<ProductModel> categoryProductsList = [];
    for (int i = 0; i < data.length; i++) {
      categoryProductsList.add(ProductModel.fromJson(data[i]));
    }
    // the returning products list
    return categoryProductsList;
  }
}
