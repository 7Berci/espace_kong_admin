import 'package:espace_kong_admin/commandes_folder/catalog_product_wash_iron/button_to_home_shop_wash_iron.dart.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_autres_products_superexpress.dart';

// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
class AutreSuperExpressWashandIron extends StatelessWidget {
  final String email;
  final String id;
  final ville;
  final quartier;
  const AutreSuperExpressWashandIron({
    super.key,
    required this.id,
    required this.email,
    required this.ville,
    required this.quartier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Autre Super Express')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogOthersProductsSuperExpressWashandIron(),
            CartButton(email: email, ville: ville, quartier: quartier),
            SizedBox(height: 10),
            CartToMainButtonWashnIron(
              id: id,
              email: email,
              ville: ville,
              quartier: quartier,
            ),
          ],
        ),
      ),
    );
  }
}
