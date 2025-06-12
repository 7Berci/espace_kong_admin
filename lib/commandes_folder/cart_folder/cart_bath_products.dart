import '../catalog_product/products_model_list.dart';
import 'package:flutter/material.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class CartBathProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartBathProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Bain à laver'),
        ),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: Obx(
        () => SizedBox(
          height: 600,
          child: ListView.builder(
            itemCount: controller.productasbath.length,
            itemBuilder: (BuildContext context, int index) {
              return CartBathProductCard(
                controller: controller,
                product: controller.productasbath.keys.toList()[index],
                quantity: controller.productasbath.values.toList()[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartBathProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartBathProductCard({
    super.key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(product.photo),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(product.nameproduct),
        ),
        Text('$quantity'),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(17.0, 0, 0, 0),
        //   child: IconButton(
        //     onPressed: () {
        //       controller.removeAllProductBath(product);
        //       controller.reduceAllBathCounter(product);
        //     },
        //     icon: Icon(Icons.highlight_remove),
        //   ),
        // ),
      ]),
    );
  }
}
