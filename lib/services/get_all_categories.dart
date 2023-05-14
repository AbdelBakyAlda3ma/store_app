import 'package:store_app/helper/api_class.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    // http get method returning list of categories
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    // the returning list
    return data;
  }
}
