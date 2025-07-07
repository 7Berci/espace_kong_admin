import 'package:espace_kong_admin/commandes_folder/catalog_product/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_vetements_products.dart';

class Clothes extends StatefulWidget {
  final String id;
  final String email;
  final ville;
  final quartier;
  const Clothes({
    super.key,
    required this.ville,
    required this.quartier,
    required this.id,
    required this.email,
  });

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
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
            CatalogVetementsProducts(),
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
