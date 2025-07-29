import 'package:espace_kong_admin/commandes_folder/ajouter_lavage/ajouter_lavage_normal_screen.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart_folder/cart_controller.dart';
import '../catalog_product_wash/catalog_accessoires_screen_express.dart';
import '../catalog_product_wash/catalog_autres_screen_express.dart';
import '../catalog_product_wash/catalog_bain_screen_express.dart';
import '../catalog_product_wash/catalog_literie_screen_express.dart';
import '../catalog_product_wash/catalog_special_screen_express.dart';
import '../catalog_product_wash/catalog_vetements_screen_express.dart';
import '../catalog_product_wash/products_model_list.dart';

class AjouterExpressWash extends StatefulWidget {
  final String id;
  final String email;
  final ville;
  final quartier;

  const AjouterExpressWash({
    super.key,
    required this.id,
    required this.email,
    required this.ville,
    required this.quartier,
  });

  @override
  AjouterExpressWashView createState() => AjouterExpressWashView();
}

class AjouterExpressWashView extends State<AjouterExpressWash> {
  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    // Vous pouvez utiliser widget.email ici si nécessaire
    print('Email reçu : ${widget.email}');
  }

  void initAllClothesExpress(List<Product> allProducts) {
    final clothesExpressProducts =
        allProducts
            .where((p) => p.cat == 'Clothes' && p.type == 'express')
            .toList();
    for (final product in clothesExpressProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllSpecialExpress(List<Product> allProducts) {
    final specialExpressProducts =
        allProducts
            .where((p) => p.cat == 'Special' && p.type == 'express')
            .toList();
    for (final product in specialExpressProducts) {
      cartController.specialInitCounter(product);
      cartController.specialInitRealCounter(product);
    }
  }

  void initAllAccessoriesExpress(List<Product> allProducts) {
    final accessoriesExpressProducts =
        allProducts
            .where((p) => p.cat == 'Accessories' && p.type == 'express')
            .toList();
    for (final product in accessoriesExpressProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllBathExpress(List<Product> allProducts) {
    final bathExpressProducts =
        allProducts
            .where((p) => p.cat == 'Bath' && p.type == 'express')
            .toList();
    for (final product in bathExpressProducts) {
      cartController.bathInitCounter(product);
      cartController.bathInitRealCounter(product);
    }
  }

  void initAllBeddingExpress(List<Product> allProducts) {
    final beddingExpressProducts =
        allProducts
            .where((p) => p.cat == 'Bedding' && p.type == 'express')
            .toList();
    for (final product in beddingExpressProducts) {
      cartController.beddingInitCounter(product);
      cartController.beddingInitRealCounter(product);
    }
  }

  void initAllOthersExpress(List<Product> allProducts) {
    final othersExpressProducts =
        allProducts
            .where((p) => p.cat == 'Others' && p.type == 'express')
            .toList();
    for (final product in othersExpressProducts) {
      cartController.othersInitCounter(product);
      cartController.othersInitRealCounter(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      initAllClothesExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => ClothesExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/chemisemc.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Vêtements (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            initAllClothesExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => ClothesExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_box_rounded),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      initAllSpecialExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => SpecialExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/robedemariage.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Spécial (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            initAllSpecialExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => SpecialExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      initAllAccessoriesExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => AccessoriesExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/chapeau.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Accessoires (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            initAllAccessoriesExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => AccessoriesExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      initAllBathExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => BainExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/serviettegrande.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Bain (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            initAllBathExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => BainExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      initAllBeddingExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => LiterieExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/oreiller.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Literie (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            initAllBeddingExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => LiterieExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      initAllOthersExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => AutreExpress(
                                id: widget.id,
                                email: widget.email,
                                ville: widget.ville,
                                quartier: widget.quartier,
                              ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: showPictures('images/tapis.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Autre (Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            initAllOthersExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => AutreExpress(
                                      id: widget.id,
                                      email: widget.email,
                                      ville: widget.ville,
                                      quartier: widget.quartier,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
            Text('Commandes du client : ${widget.email}'),
            const SizedBox(height: 18.0),
            CartButton(
              email: widget.email,
              ville: widget.ville,
              quartier: widget.quartier,
            ),
            SizedBox(height: 29.0),
          ],
        ),
      ),
    );
  }
}
