import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_literie_products_express.dart';

// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
class LiterieExpress extends StatelessWidget {
  final String email;
  final String id;
  const LiterieExpress({super.key, required this.id, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Litérie Express')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogBeddingProductsExpress(),
            CartButton(email: email),
            SizedBox(height: 10),
            CartButtonPco(id: id, email: email),
          ],
        ),
      ),
    );
  }
}
