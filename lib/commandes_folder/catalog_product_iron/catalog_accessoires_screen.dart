import 'package:espace_kong_admin/commandes_folder/catalog_product_iron/button_to_home_shop_iron.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';

import 'catalog_accessoires_products.dart';

class AccessoriesIron extends StatelessWidget {
  final String email;
  final String id;
  final ville;
  final quartier;
  const AccessoriesIron({
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
        title: const Center(child: Text('Accessoires')),
        backgroundColor: const Color(0xFF5ACC80),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CatalogAccessoriesProductsIron(),
              CartButton(email: email, ville: ville, quartier: quartier),
              SizedBox(height: 10),
              CartToMainButtonIron(id: id, email: email, ville: ville, quartier: quartier),
            ],
          ),
        ),
      ),
    );
  }
}
