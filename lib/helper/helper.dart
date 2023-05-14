// favoriteProductList.isEmpty
//           ? const Center(
//               child: Text('there is any favorite products'),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(60),
//               child: GridView.builder(
//                 clipBehavior: Clip.none,
//                 itemCount: favoriteProductList.length,
//                 itemBuilder: (context, index) => Align(
//                   alignment: Alignment.center,
//                   child: CustomCard(
//                     product: favoriteProductList[index],
//                     favoriteProductsList: favoriteProductList,
//                   ),
//                 ),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   mainAxisSpacing: 70,
//                   childAspectRatio: 1.5,
//                 ),
//               ),
//             ),
    