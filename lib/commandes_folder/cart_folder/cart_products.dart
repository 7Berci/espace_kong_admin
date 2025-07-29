import '../catalog_product_wash/products_model_list.dart';
import 'package:flutter/material.dart';
// import 'cart_accessories_products.dart';
// import 'cart_bath_products.dart';
// import 'cart_bedding_products.dart';
import 'cart_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// import '../cart_folder/cart_clothes_products.dart';
// import 'cart_others_products.dart';
// import 'cart_special_products.dart';

class CartProduts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProduts({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () => SizedBox(
        //     height: 600,
        //child:
        Flexible(
      child: ListView.builder(
        itemCount: controller.generalListing.length,
        itemBuilder: (BuildContext context, int index) {
          return CartClothesProductCard(
            controller: controller,
            productss: controller.generalListing.keys.toList()[index],
            quantity: controller.generalListing.values.toList()[index],
            index: index,
          );
        },
      ),
      //   ),
      // ),
    );
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
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
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
      ]),
    );
  }
}