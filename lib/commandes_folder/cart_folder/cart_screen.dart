import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'cart_controller.dart';
import 'cart_products.dart';
import 'cart_total.dart';

class CartScreen extends StatelessWidget {
  final email;
  CartScreen({super.key, required this.email});

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Mon panier')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: Column(children: [CartProduts(), CartTotalSum(email: email)]),
    );
  }
}

class CartButton extends StatefulWidget {
  final String email;
  const CartButton({super.key, required this.email});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  final cartControlla = Get.put(CartController());
  bool changeIcon = true;

  // void navigateToNewPage(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AjouterNormal(id: widget.id, email: widget.email),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    void activateOnPressed() {
      if (cartControlla.isCartEmpty()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Aucun produit dans le panier.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Ferme la popup
                  },
                ),
              ],
            );
          },
        );
      } else {
        performAllButtonBySuExpressCounter;
        initAllrkValue;
      }
    }

    return Center(
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              if (cartControlla.isCartEmpty()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erreur'),
                      content: Text('Aucun produit dans le panier.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (builder) => CartScreen(email: widget.email),
                  ),
                );
                activateOnPressed();
                // cartControlla.realIfSuExpress(),
                // cartControlla.ifSuExpress(),
                cartControlla.ifsigned();
              }
            },
            color: Colors.yellow,
            height: 55.0,
            child: const Text(
              "AJOUTER CES ARTICLES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
