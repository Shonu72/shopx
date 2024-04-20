import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/add_cart_controller.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/views/cart_details.dart';
import 'package:shopx/views/widgets/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShoppingPage extends StatelessWidget {
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());
  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 101, 124, 135),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 91, 101, 120),
          leading: IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          title: const Text(
            'HK Shop',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          actions: [
            SizedBox(
              height: 40,
              width: 80,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartDetails()));
                  },
                  backgroundColor: Colors.blue,
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: GetX<CartController>(builder: (controller) {
                    return Text(
                      controller.count.toString(),
                      style: const TextStyle(color: Colors.white),
                    );
                  })),
            ),
          ]),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Row(
          //     children: [
          //       const Expanded(
          //         child: Text(
          //           'ShopX',
          //           style: TextStyle(
          //               fontFamily: 'avenir',
          //               fontSize: 32,
          //               fontWeight: FontWeight.w900),
          //         ),
          //       ),
          //       IconButton(
          //           icon: const Icon(Icons.view_list_rounded),
          //           onPressed: () {}),
          //       IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
