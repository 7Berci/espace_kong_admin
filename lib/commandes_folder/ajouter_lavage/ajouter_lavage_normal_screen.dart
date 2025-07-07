import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_screen.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart_folder/cart_controller.dart';
import '../catalog_product/catalog_accessoires_screen.dart';
import '../catalog_product/catalog_autres_screen.dart';
import '../catalog_product/catalog_bain_screen.dart';
import '../catalog_product/catalog_literie_screen.dart';
import '../catalog_product/catalog_special_screen.dart';
import '../catalog_product/catalog_vetements_screen.dart';
import '../catalog_product/products_model_list.dart';

class AjouterNormal extends StatefulWidget {
  final String id;
  final String email;
  final ville;
  final quartier;

  const AjouterNormal({
    super.key,
    required this.id,
    required this.email,
    required this.ville,
    required this.quartier,
  });

  @override
  AjouterNormalView createState() => AjouterNormalView();
}

class AjouterNormalView extends State<AjouterNormal> {
  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    // Vous pouvez utiliser widget.email ici si nécessaire
    print('Email reçu : ${widget.email}');
  }

  void initAllClothesNormal(List<Product> allProducts) {
    final clothesNormalProducts =
        allProducts
            .where((p) => p.cat == 'Clothes' && p.type == 'normal')
            .toList();
    for (final product in clothesNormalProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllSpecialNormal(List<Product> allProducts) {
    final specialNormalProducts =
        allProducts
            .where((p) => p.cat == 'Special' && p.type == 'normal')
            .toList();
    for (final product in specialNormalProducts) {
      cartController.specialInitCounter(product);
      cartController.specialInitRealCounter(product);
    }
  }

  void initAllAccessoriesNormal(List<Product> allProducts) {
    final accessoriesNormalProducts =
        allProducts
            .where((p) => p.cat == 'Accessories' && p.type == 'normal')
            .toList();
    for (final product in accessoriesNormalProducts) {
      cartController.clothesInitCounter(product);
      cartController.clothesInitRealCounter(product);
    }
  }

  void initAllBathNormal(List<Product> allProducts) {
    final bathNormalProducts =
        allProducts
            .where((p) => p.cat == 'Bath' && p.type == 'normal')
            .toList();
    for (final product in bathNormalProducts) {
      cartController.bathInitCounter(product);
      cartController.bathInitRealCounter(product);
    }
  }

  void initAllBeddingNormal(List<Product> allProducts) {
    final beddingNormalProducts =
        allProducts
            .where((p) => p.cat == 'Bedding' && p.type == 'normal')
            .toList();
    for (final product in beddingNormalProducts) {
      cartController.beddingInitCounter(product);
      cartController.beddingInitRealCounter(product);
    }
  }

  void initAllOthersNormal(List<Product> allProducts) {
    final othersNormalProducts =
        allProducts
            .where((p) => p.cat == 'Others' && p.type == 'normal')
            .toList();
    for (final product in othersNormalProducts) {
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
                      initAllClothesNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Clothes(
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
                            'Vêtements',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            initAllClothesNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Clothes(
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
                      initAllSpecialNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Special(
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
                            'Spécial',
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
                            initAllSpecialNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Special(
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
                      initAllAccessoriesNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Accessories(
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
                            'Accessoires',
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
                            initAllAccessoriesNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Accessories(
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
                      initAllBathNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Bain(
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
                            'Bain',
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
                            initAllBathNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Bain(
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
                      initAllBeddingNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Literie(
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
                            'Literie',
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
                            initAllBeddingNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Literie(
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
                      initAllOthersNormal;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (builder) => Autre(
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
                            'Autre',
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
                            initAllOthersNormal;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder:
                                    (builder) => Autre(
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

int number = 0;

Widget myDialog() {
  return const AlertDialog();
}

Widget showPictures(String image) {
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: eclatColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Container(
        width: 38.0,
        height: 38.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: AssetImage(image),
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    ),
  );
}
