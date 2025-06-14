import 'package:espace_kong_admin/commandes_folder/ajouter_normal_screen.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_folder/cart_controller.dart';
import 'catalog_product/catalog_accessoires_screen_superexpress.dart';
import 'catalog_product/catalog_autres_screen_superexpress.dart';
import 'catalog_product/catalog_bain_screen_superexpress.dart';
import 'catalog_product/catalog_literie_screen_superexpress.dart';
import 'catalog_product/catalog_special_screen_superexpress.dart';
import 'catalog_product/catalog_vetements_screen_superexpress.dart';
import 'catalog_product/products_model_list.dart';

class AjouterSuperExpress extends StatefulWidget {
  final String id;
  final String email;

  const AjouterSuperExpress({super.key, required this.id, required this.email});

  @override
  AjouterSuperExpressView createState() => AjouterSuperExpressView();
}

class AjouterSuperExpressView extends State<AjouterSuperExpress> {
  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    // Vous pouvez utiliser widget.email ici si nécessaire
    print('Email reçu : ${widget.email}');
  }

  void initAllClothesSuperExpress(List<Product> allProducts) {
    final clothesSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Clothes' && p.type == 'super express')
            .toList();
    for (final product in clothesSuperExpressProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllSpecialSuperExpress(List<Product> allProducts) {
    final specialSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Special' && p.type == 'super express')
            .toList();
    for (final product in specialSuperExpressProducts) {
      cartController.specialInitCounter(product);
      cartController.specialInitRealCounter(product);
    }
  }

  void initAllAccessoriesSuperExpress(List<Product> allProducts) {
    final accessoriesSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Accessories' && p.type == 'super express')
            .toList();
    for (final product in accessoriesSuperExpressProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllBathSuperExpress(List<Product> allProducts) {
    final bathSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Bath' && p.type == 'super express')
            .toList();
    for (final product in bathSuperExpressProducts) {
      cartController.bathInitCounter(product);
      cartController.bathInitRealCounter(product);
    }
  }

  void initAllBeddingSuperExpress(List<Product> allProducts) {
    final beddingSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Bedding' && p.type == 'super express')
            .toList();
    for (final product in beddingSuperExpressProducts) {
      cartController.beddingInitCounter(product);
      cartController.beddingInitRealCounter(product);
    }
  }

  void initAllOthersSuperExpress(List<Product> allProducts) {
    final othersSuperExpressProducts =
        allProducts
            .where((p) => p.cat == 'Others' && p.type == 'super express')
            .toList();
    for (final product in othersSuperExpressProducts) {
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
                      initAllClothesSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => ClothesSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Vêtements (Super Express)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            initAllClothesSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => ClothesSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
                      initAllSpecialSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => SpecialSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Spécial (Super Express)',
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
                            initAllSpecialSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => SpecialSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
                      initAllAccessoriesSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => AccessoriesSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Accessoires (Super Express)',
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
                            initAllAccessoriesSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => AccessoriesSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
                      initAllBathSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => BainSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Bain (Super Express)',
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
                            initAllBathSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => BainSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
                      initAllBeddingSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => LiterieSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Literie (Super Express)',
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
                            initAllBeddingSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => LiterieSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
                      initAllOthersSuperExpress;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => AutreSuperExpress(
                                id: widget.id,
                                email: widget.email,
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
                            'Autre (Super Express)',
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
                            initAllOthersSuperExpress;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => AutreSuperExpress(
                                      id: widget.id,
                                      email: widget.email,
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
            CartButton(email: widget.email),
            SizedBox(height: 29.0),
          ],
        ),
      ),
    );
  }
}
