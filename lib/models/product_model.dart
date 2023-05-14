class ProductModel {
  final int id;
  final String title;
  final String price;
  final String category;
  final String image;
  final String descrition;
  // final RatingModel rating;

  bool isFavourite = false;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.descrition,
    // required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      category: jsonData['category'],
      image: jsonData['image'],
      descrition: jsonData['description'],
      // rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

// class RatingModel {
//   final String? rate;
//   final int? count;
//   RatingModel({
//     required this.count,
//     required this.rate,
//   });

//   factory RatingModel.fromJson(jsonData) {
//     return RatingModel(
//       count: jsonData['count'] ,
//       rate: jsonData['rate'].toString(),
//     );
//   }
// }
