import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_vetements_products_superexpress.dart';

class ClothesSuperExpress extends StatelessWidget {
  final String id;
  final String email;
  const ClothesSuperExpress({super.key, required this.id, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Vêtements Super Express')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogVetementsProductsSuperExpress(),
            CartButton(email: email),
            SizedBox(height: 10),
            CartButtonPco(id: id, email: email),
          ],
        ),
      ),
    );
  }
}
