import 'package:espace_kong_admin/commandes_folder/ajouter_lavage_repassage/ajouter_articles_lavagerepassage_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:flutter/material.dart';

class CartToMainButtonWashnIron extends StatefulWidget {
  final String id;
  final String email;
  final ville;
  final quartier;

  const CartToMainButtonWashnIron({
    super.key,
    required this.id,
    required this.email,
    required this.ville,
    required this.quartier,
  });

  @override
  State<CartToMainButtonWashnIron> createState() => _CartToMainButtonWashnIronState();
}

class _CartToMainButtonWashnIronState extends State<CartToMainButtonWashnIron> {
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
                      (builder) => ArticlesToWashnIron(
                        id: widget.id,
                        email: widget.email,
                        ville: widget.ville,
                        quartier: widget.quartier,
                      ),
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
