import '../catalog_product/products_model_list.dart';
import 'package:flutter/material.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class CartClothesProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartClothesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Vêtement à laver'),
          ),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        body: Obx(
          () => SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: controller.productasclothes.length,
              itemBuilder: (BuildContext context, int index) {
                return CartClothesProductCard(
                  controller: controller,
                  productss: controller.productasclothes.keys.toList()[index],
                  quantity: controller.productasclothes.values.toList()[index],
                  index: index,
                );
              },
            ),
          ),
        ));
  }
}

class CartClothesProductCard extends StatelessWidget {
  final CartController controller;
  final Product productss;
  final int quantity;
  final int index;
  const CartClothesProductCard({
    super.key,
    required this.controller,
    required this.productss,
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
          backgroundImage: AssetImage(productss.photo),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(productss.nameproduct),
        ),
        Text('$quantity'),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(17.0, 0, 0, 0),
        //   child: IconButton(
        //     onPressed: () {
        //       controller.removeAllProductClothes(product);
        //       controller.reduceAllClothesCounter(product);
        //     },
        //     icon: Icon(Icons.highlight_remove),
        //   ),
        // ),
      ]),
    );
  }
}
