import 'package:espace_kong_admin/commandes_folder/catalog_product_wash_iron/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_vetements_products.dart';

class ClothesWashandIron extends StatefulWidget {
  final String id;
  final String email;
  final ville;
  final quartier;
  const ClothesWashandIron({
    super.key,
    required this.ville,
    required this.quartier,
    required this.id,
    required this.email,
  });

  @override
  State<ClothesWashandIron> createState() => _ClothesWashandState();
}

class _ClothesWashandState extends State<ClothesWashandIron> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Vêtements')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: 900,
        child: Column(
          children: [
            CatalogVetementsProductsWashandIron(),
            const SizedBox(height: 10),
            CartButton(
              email: widget.email,
              ville: widget.ville,
              quartier: widget.quartier,
            ),
            const SizedBox(height: 10),
            CartButtonPco(
              id: widget.id,
              email: widget.email,
              ville: widget.ville,
              quartier: widget.quartier,
            ),
          ],
        ),
      ),
    );
  }
}
