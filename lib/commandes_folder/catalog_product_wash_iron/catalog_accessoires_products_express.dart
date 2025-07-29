import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import '../catalog_product_wash/products_model_list.dart';
import 'package:flutter/material.dart';
import '../cart_folder/cart_controller.dart';
import 'package:get/get.dart';

class CatalogAccessoriesProductsExpressWashandIron extends StatefulWidget {
  const CatalogAccessoriesProductsExpressWashandIron({super.key});

  @override
  State<CatalogAccessoriesProductsExpressWashandIron> createState() =>
      _CatalogAccessoriesProductsExpressWashandIronState();
}

class _CatalogAccessoriesProductsExpressWashandIronState
    extends State<CatalogAccessoriesProductsExpressWashandIron> {
  late Future<List<Product>> mergedProducts;

  @override
  void initState() {
    super.initState();
    mergedProducts = fetchMergedProducts();
  }

  Future<List<Product>> fetchMergedProducts() async {
    final productsSnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('cat', isEqualTo: 'Acc')
        .where('type', isEqualTo: 'express')
        .get();

    final ironSnapshot = await FirebaseFirestore.instance
        .collection('products_iron')
        .where('cat', isEqualTo: 'Acc')
        .where('type', isEqualTo: 'express')
        .get();

    final ironMap = {
      for (var doc in ironSnapshot.docs)
        doc['id']: doc['price'] ?? 0
    };

    return productsSnapshot.docs.map((doc) {
      final data = doc.data();
      final ironPrice = ironMap[data['id']] ?? 0;
      return Product(
        id: data['id'],
        cat: data['cat'],
        type: data['type'],
        nameproduct: data['nameproduct'],
        photo: data['photo'],
        price: (data['price'] ?? 0) + ironPrice,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: mergedProducts,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final products = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return CatalogAccessoriesProductsCardExpress(
              product: products[index],
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CatalogAccessoriesProductsCardExpress extends StatelessWidget {
  int counter = 0;
  final cartController = Get.put(CartController());
  final Product product;
  CatalogAccessoriesProductsCardExpress({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(width: 12.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: eclatColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: AssetImage(product.photo),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 9.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 200.0,
                        child: Text(
                          product.nameproduct,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 23.0,
                            height: 23.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              onPressed: () {
                                cartController.reduceClothesCounter(product);
                                cartController.removeProductClothes(product);
                                cartController.removeFromGeneralListing(product);
                              },
                              iconSize: 15.0,
                              padding: const EdgeInsets.all(0.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => Text(
                                "${cartController.clothesCounterl(product)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 23.0,
                            height: 23.0,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0, color: Colors.white),
                              onPressed: () {
                                cartController.addClothesCounter(product);
                                cartController.addProductClothes(product);
                                cartController.addToGeneralListing(product);
                              },
                              padding: const EdgeInsets.all(0.0),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${product.price} FCFA',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
