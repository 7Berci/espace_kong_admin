import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:flutter/material.dart';
import 'catalog_special_products_superexpress.dart';

class SpecialSuperExpress extends StatelessWidget {
  const SpecialSuperExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Special Super Express'),
          ),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CatalogSpecialProductsSuperExpress(),
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
