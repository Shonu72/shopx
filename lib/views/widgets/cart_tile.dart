import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/add_cart_controller.dart';
import 'package:shopx/models/product.dart';

class CartTile extends StatelessWidget {
  final Product product;
  final String image;
  final String name;
  final String price;
  final String category;
  final int quantity;

  const CartTile({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image(image: NetworkImage(image)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              cartController.removeFromCart(product);
                            },
                            icon: const Icon(Icons.remove)),
                        // Text('1'),
                        // GetX<CartController>(
                        //   builder: (controller) => Text(
                        //     '${controller.getProductQuantity(product)}',
                        //   ),
                        // ),
                        Text('$quantity'),
                        IconButton(
                            onPressed: () {
                              cartController.addToCart(product);
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                        Text(
                          "\$$price",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        const Text(
                          "In stock",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        const Text(
                          "Eligible for free shipping",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "category: $category",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              SnackBar snackBar = const SnackBar(
                                content: Text('Checkout not implemented yet!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Text(
                              'Check out',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
