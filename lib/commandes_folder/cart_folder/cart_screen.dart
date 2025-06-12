import 'package:flutter/material.dart';
import 'cart_products.dart';
import 'cart_total.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Mon panier'),
        ),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: Column(
        children: [
          CartProduts(),
          CartTotalSum(),
        ],
      ),
    );
  }
}
