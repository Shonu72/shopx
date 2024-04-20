import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/add_cart_controller.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final productController = Get.find<ProductController>();
    return Card(
      color: Colors.white70,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.imageLink,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
                const Positioned(
                  right: 8,
                  top: 4,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.description,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            if (product.rating == null)
              const Text("No Rating yet")
            else
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price}',
                    style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
                FloatingActionButton.small(
                  onPressed: () {
                    cartController.addToCart(productController.productList[
                        productController.productList.indexOf(product)]);
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
