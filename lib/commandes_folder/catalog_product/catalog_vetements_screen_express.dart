import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:flutter/material.dart';
import 'catalog_vetements_products_express.dart';

class ClothesExpress extends StatelessWidget {
  const ClothesExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Vêtements Express'),
          ),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        body: SafeArea(
          child: Column(
            children: [ 
              CatalogVetementsProductsExpress(),
              CartButton(),
              SizedBox(
                    height: 10,
                  ),
              CartButtonPco()
            ],
          ),
        ));
  }
}
