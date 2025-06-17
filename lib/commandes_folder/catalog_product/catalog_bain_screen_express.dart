import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_bain_products_express.dart';

class BainExpress extends StatelessWidget {
  final String email;
  final String id;
  final ville;
  final quartier;
  const BainExpress({super.key,
    required this.ville,
    required this.quartier, required this.id, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Bain Express')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogBathProductsExpress(),
            CartButton(email: email, ville: ville, quartier: quartier),
            SizedBox(height: 10),
            CartButtonPco(id: id, email: email, ville: ville, quartier: quartier),
          ],
        ),
      ),
    );
  }
}
