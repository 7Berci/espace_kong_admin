import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import '../cart_folder/cart_accessories_products.dart';
import '../cart_folder/cart_bath_products.dart';
import '../cart_folder/cart_bedding_products.dart';
import '../cart_folder/cart_clothes_products.dart';
import '../cart_folder/cart_controller.dart';
import '../cart_folder/cart_others_products.dart';
import '../cart_folder/cart_special_products.dart';
import '../cart_folder/cart_total.dart';
import '../catalog_product/products_model_list.dart';

class ClientOrdersScreen extends StatelessWidget {
  final String email;
  final String ville;
  final String quartier;
  ClientOrdersScreen({
    super.key,
    required this.email,
    required this.ville,
    required this.quartier,
  });

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(child: Text('Commande du client')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 200,
                color: Colors.grey.shade100,
                child: Align(
                  alignment: Alignment.center,
                  // FractionalOffset(0.0, 0.0),
                  child: Column(
                    children: const [
                      Text(
                        'Client : Berci Djélé',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                          // color: Colors.white,
                        ),
                      ),
                      Text(
                        'Contact : 0779248952',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            AdminCartProduct(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CartTotalSum(
                email: email,
                ville: ville,
                quartier: quartier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminCartProduct extends StatelessWidget {
  AdminCartProduct({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Vêtements à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),

              Text(
                '${controller.totalclothe} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.clothesDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartClothesProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Spécial à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),
              Text(
                '${controller.totalspecial} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.specialDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartSpecialProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Accessoires à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),
              Text(
                '${controller.totalaccessory} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.accessoriesDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartAccessoriesProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Bain à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),
              Text(
                '${controller.totalbath} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.bathDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartBathProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Litérie à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),
              Text(
                '${controller.totalbedding} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.beddingDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartBeddingProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Autre à laver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              const Spacer(),
              Text(
                '${controller.totalother} FCFA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              FutureBuilder<List<Product>>(
                future: fetchAllProducts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final allProducts = snapshot.data!;
                  return IconButton(
                    onPressed: () {
                      for (final product in allProducts) {
                        controller.othersDropOutInitrkvalue(product);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => CartOthersProducts(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eclatColor,
                      fixedSize: const Size(200.0, 55.0),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded),
                  );
                },
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

Widget showPictureOnline(String image) {
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
            image: NetworkImage(image),
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    ),
  );
}
