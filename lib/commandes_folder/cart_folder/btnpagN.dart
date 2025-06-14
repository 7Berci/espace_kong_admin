import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:flutter/material.dart';

class CartButtonPco extends StatefulWidget {
  final String id;
  final String email;

  const CartButtonPco({super.key, required this.id, required this.email});

  @override
  State<CartButtonPco> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButtonPco> {
  bool changeIcon = true;

  @override
  Widget build(BuildContext context) {
    void activateOnPressed() {
      if (controller.isCartEmpty()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Avertissement!!!'),
              content: const Text('Aucun produit sélectionné dans le panier.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (builder) => Articles(id: widget.id, email: widget.email),
                ),
              );
              activateOnPressed();
              controller.ifsigned();
            },

            color: Colors.green,
            height: 55.0,

            child: const Text(
              "POURSUIVRE MA COMMANDE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
