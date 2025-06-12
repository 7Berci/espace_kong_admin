import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/btnpagN.dart';
import 'package:flutter/material.dart';
import 'catalog_vetements_products.dart';

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Vêtements'),
          ),
          backgroundColor: const Color(0xFF5ACC80),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          height: 900,
          child: Column(
            children: [
              CatalogVetementsProducts(),
              const SizedBox(
                height: 10,
              ),
              const CartButton(),
              const SizedBox(
                height: 10,
              ),
              const CartButtonPco()
            ],
          ),
        ));
  }

  Future<void> navigateToNextPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Articles()),
    );
  }
}