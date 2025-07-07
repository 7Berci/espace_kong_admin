import 'package:espace_kong_admin/commandes_folder/catalog_product/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_autres_products_express.dart';

// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
class AutreExpress extends StatelessWidget {
  final String email;
  final String id;
  final ville;
  final quartier;
  const AutreExpress({super.key, required this.id, required this.email
   , required this.ville,
    required this.quartier,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Autre Express')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogOthersProductsExpress(),
            CartButton(email: email, ville: ville, quartier: quartier),
            SizedBox(height: 10),
            CartButtonPco(id: id, email: email, ville: ville, quartier: quartier),
          ],
        ),
      ),
    );
  }
}
