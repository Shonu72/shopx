import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/add_cart_controller.dart';
import 'package:shopx/views/widgets/cart_tile.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Details'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.person,
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total price for selected items: \$${controller.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              );
            }),
            GetX<CartController>(builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      product: controller.cartItems[index],
                      image: controller.cartItems[index].imageLink,
                      name: controller.cartItems[index].name,
                      price: controller.cartItems[index].price,
                      category: "Beauty",
                      quantity: controller
                          .getProductQuantity(controller.cartItems[index]),
                    );
                  },
                ),
              );
            }),
          ],
        ));
  }
}
