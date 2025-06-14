import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_vetements_products.dart';

class Clothes extends StatefulWidget {
  final String id;
  final String email;
  const Clothes({super.key, required this.id, required this.email});

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
            CartButton(email: widget.email),
            const SizedBox(height: 10),
            CartButtonPco(id: widget.id, email: widget.email),
          ],
        ),
      ),
    );
  }
}
