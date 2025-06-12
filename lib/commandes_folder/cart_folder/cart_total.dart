//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import '../catalog_product/products_model_list.dart';
import 'cart_bill.dart';
import 'cart_controller.dart';

final userr = FirebaseAuth.instance.currentUser!;
int i = 0;
final CartController controller = Get.find();

// Future<List<Product>> fetchAllProducts() async {
//   final snapshot = await FirebaseFirestore.instance.collection('products').get();
//   return snapshot.docs.map((doc) => Product.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
// }d
void initAllCounters(List<Product> allProducts) {
  final clothesNormalProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'normal').toList();
  final clothesExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'express').toList();
  final clothesSuperExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'super express').toList();
  final specialNormalProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'normal').toList();
  final specialExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'express').toList();
  final specialSuperExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'super express').toList();
  final accessoriesNormalProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'normal').toList();
  final accessoriesExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'express').toList();
  final accessoriesSuperExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'super express').toList();
  final beddingNormalProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'normal').toList();
  final beddingExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'express').toList();
  final beddingSuperExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'super express').toList();
  final othersNormalProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'normal').toList();
  final othersExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'express').toList();
  final othersSuperExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'super express').toList();
  final bathNormalProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'normal').toList();
  final bathExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'express').toList();
  final bathSuperExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'super express').toList();
  for (final product in clothesNormalProducts) {
    controller.clothesInitCounter(product);
  }
  for (final product in clothesExpressProducts) {
    controller.clothesInitCounter(product);
  }
  for (final product in clothesSuperExpressProducts) {
    controller.clothesInitCounter(product);
  }
  for (final product in specialNormalProducts) {
    controller.specialInitCounter(product);
  }
  for (final product in specialExpressProducts) {
    controller.specialInitCounter(product);
  }
  for (final product in specialSuperExpressProducts) {
    controller.specialInitCounter(product);
  }
  for (final product in othersNormalProducts) {
    controller.othersInitCounter(product);
  }
  for (final product in othersExpressProducts) {
    controller.othersInitCounter(product);
  }
  for (final product in othersSuperExpressProducts) {
    controller.othersInitCounter(product);
  }
  for (final product in beddingNormalProducts) {
    controller.beddingInitCounter(product);
  }
  for (final product in beddingExpressProducts) {
    controller.beddingInitCounter(product);
  }
  for (final product in beddingSuperExpressProducts) {
    controller.beddingInitCounter(product);
  }
  for (final product in bathNormalProducts) {
    controller.bathInitCounter(product);
  }
  for (final product in bathExpressProducts) {
    controller.bathInitCounter(product);
  }
  for (final product in bathSuperExpressProducts) {
    controller.bathInitCounter(product);
  }
  for (final product in accessoriesNormalProducts) {
    controller.accessoriesInitCounter(product);
  }
  for (final product in accessoriesExpressProducts) {
    controller.accessoriesInitCounter(product);
  }
  for (final product in accessoriesSuperExpressProducts) {
    controller.accessoriesInitCounter(product);
  }
}

void initAllrkValue(List<Product> allProducts) {
  final clothesNormalProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'normal').toList();
  final clothesExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'express').toList();
  final clothesSuperExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'super express').toList();
  final specialNormalProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'normal').toList();
  final specialExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'express').toList();
  final specialSuperExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'super express').toList();
  final accessoriesNormalProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'normal').toList();
  final accessoriesExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'express').toList();
  final accessoriesSuperExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'super express').toList();
  final beddingNormalProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'normal').toList();
  final beddingExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'express').toList();
  final beddingSuperExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'super express').toList();
  final othersNormalProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'normal').toList();
  final othersExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'express').toList();
  final othersSuperExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'super express').toList();
  final bathNormalProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'normal').toList();
  final bathExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'express').toList();
  final bathSuperExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'super express').toList();
  for (final product in clothesNormalProducts) {
    controller.clothesInitrkvalue(product);
  }
  for (final product in clothesExpressProducts) {
    controller.clothesInitrkvalue(product);
  }
  for (final product in clothesSuperExpressProducts) {
    controller.clothesInitrkvalue(product);
  }
  for (final product in specialNormalProducts) {
    controller.specialInitrkvalue(product);
  }
  for (final product in specialExpressProducts) {
    controller.specialInitrkvalue(product);
  }
  for (final product in specialSuperExpressProducts) {
    controller.specialInitrkvalue(product);
  }
  for (final product in othersNormalProducts) {
    controller.othersInitrkvalue(product);
  }
  for (final product in othersExpressProducts) {
    controller.othersInitrkvalue(product);
  }
  for (final product in othersSuperExpressProducts) {
    controller.othersInitrkvalue(product);
  }
  for (final product in beddingNormalProducts) {
    controller.beddingInitrkvalue(product);
  }
  for (final product in beddingExpressProducts) {
    controller.beddingInitrkvalue(product);
  }
  for (final product in beddingSuperExpressProducts) {
    controller.beddingInitrkvalue(product);
  }
  for (final product in bathNormalProducts) {
    controller.bathInitrkvalue(product);
  }
  for (final product in bathExpressProducts) {
    controller.beddingInitrkvalue(product);
  }
  for (final product in bathSuperExpressProducts) {
    controller.beddingInitrkvalue(product);
  }
  for (final product in accessoriesNormalProducts) {
    controller.accessoriesInitrkvalue(product);
  }
  for (final product in accessoriesExpressProducts) {
    controller.accessoriesInitrkvalue(product);
  }
  for (final product in accessoriesSuperExpressProducts) {
    controller.accessoriesInitrkvalue(product);
  }
}

void initAllRealCounters(List<Product> allProducts) {
  final clothesNormalProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'normal').toList();
  final clothesExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'express').toList();
  final clothesSuperExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'super express').toList();
  final specialNormalProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'normal').toList();
  final specialExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'express').toList();
  final specialSuperExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'super express').toList();
  final accessoriesNormalProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'normal').toList();
  final accessoriesExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'express').toList();
  final accessoriesSuperExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'super express').toList();
  final beddingNormalProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'normal').toList();
  final beddingExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'express').toList();
  final beddingSuperExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'super express').toList();
  final othersNormalProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'normal').toList();
  final othersExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'express').toList();
  final othersSuperExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'super express').toList();
  final bathNormalProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'normal').toList();
  final bathExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'express').toList();
  final bathSuperExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'super express').toList();
  for (final product in clothesNormalProducts) {
    controller.clothesInitRealCounter(product);
  }
  for (final product in clothesExpressProducts) {
    controller.clothesInitRealCounter(product);
  }
  for (final product in clothesSuperExpressProducts) {
    controller.clothesInitRealCounter(product);
  }
  for (final product in specialNormalProducts) {
    controller.specialInitRealCounter(product);
  }
  for (final product in specialExpressProducts) {
    controller.specialInitRealCounter(product);
  }
  for (final product in specialSuperExpressProducts) {
    controller.specialInitRealCounter(product);
  }
  for (final product in othersNormalProducts) {
    controller.othersInitRealCounter(product);
  }
  for (final product in othersExpressProducts) {
    controller.othersInitRealCounter(product);
  }
  for (final product in othersSuperExpressProducts) {
    controller.othersInitRealCounter(product);
  }
  for (final product in beddingNormalProducts) {
    controller.beddingInitRealCounter(product);
  }
  for (final product in beddingExpressProducts) {
    controller.beddingInitRealCounter(product);
  }
  for (final product in beddingSuperExpressProducts) {
    controller.beddingInitRealCounter(product);
  }
  for (final product in bathNormalProducts) {
    controller.bathInitRealCounter(product);
  }
  for (final product in bathExpressProducts) {
    controller.bathInitRealCounter(product);
  }
  for (final product in bathSuperExpressProducts) {
    controller.bathInitRealCounter(product);
  }
  for (final product in accessoriesNormalProducts) {
    controller.accessoriesInitRealCounter(product);
  }
  for (final product in accessoriesExpressProducts) {
    controller.accessoriesInitRealCounter(product);
  }
  for (final product in accessoriesSuperExpressProducts) {
    controller.accessoriesInitRealCounter(product);
  }
}

void replaceAllZeroValue(List<Product> allProducts) {
  final clothesNormalProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'normal').toList();
  final clothesExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'express').toList();
  final clothesSuperExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'super express').toList();
  final specialNormalProducts = allProducts.where((p) => p.cat == 'Spe' && p.type == 'normal').toList();
  final specialExpressProducts = allProducts.where((p) => p.cat == 'Spe' && p.type == 'express').toList();
  final specialSuperExpressProducts = allProducts.where((p) => p.cat == 'Spe' && p.type == 'super express').toList();
  final accessoriesNormalProducts = allProducts.where((p) => p.cat == 'Acc' && p.type == 'normal').toList();
  final accessoriesExpressProducts = allProducts.where((p) => p.cat == 'Acc' && p.type == 'express').toList();
  final accessoriesSuperExpressProducts = allProducts.where((p) => p.cat == 'Acc' && p.type == 'super express').toList();
  final beddingNormalProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'normal').toList();
  final beddingExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'express').toList();
  final beddingSuperExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'super express').toList();
  final othersNormalProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'normal').toList();
  final othersExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'express').toList();
  final othersSuperExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'super express').toList();
  final bathNormalProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'normal').toList();
  final bathExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'express').toList();
  final bathSuperExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'super express').toList();
  print('accessoriesNormalProducts lengh is: ${accessoriesNormalProducts.length}');
  print('clothesNormalProducts lengh is: ${clothesNormalProducts.length}');
  print('clothesExpressProducts lengh is: ${clothesExpressProducts.length}');
  print('clothesSuperExpressProducts lengh is: ${clothesSuperExpressProducts.length}');
  print('accessoriesExpressProducts lengh is: ${accessoriesExpressProducts.length}');
  print('accessoriesSuperExpressProducts lengh is: ${accessoriesSuperExpressProducts.length}');

  print('specialNormalProducts lengh is: ${specialNormalProducts.length}');
  print('specialExpressProducts lengh is: ${specialExpressProducts.length}');
  print('specialSuperExpressProducts lengh is: ${specialSuperExpressProducts.length}');

  print('beddingNormalProducts lengh is: ${beddingNormalProducts.length}');
  print('beddingExpressProducts lengh is: ${beddingExpressProducts.length}');
  print('beddingSuperExpressProducts lengh is: ${beddingSuperExpressProducts.length}');

  print('othersNormalProducts lengh is: ${othersNormalProducts.length}');
  print('othersExpressProducts lengh is: ${othersExpressProducts.length}');
  print('othersSuperExpressProducts lengh is: ${othersSuperExpressProducts.length}');

  print('bathNormalProducts lengh is: ${bathNormalProducts.length}');
  print('bathExpressProducts lengh is: ${bathExpressProducts.length}');
  print('bathSuperExpressProducts lengh is: ${bathSuperExpressProducts.length}');

  for (final product in clothesNormalProducts) {
    controller.clothesReplaceZerosValue(product);
  }
  for (final product in clothesExpressProducts) {
    controller.clothesReplaceZerosValue(product);
  }
  for (final product in clothesSuperExpressProducts) {
    controller.clothesReplaceZerosValue(product);
  }
  for (final product in specialNormalProducts) {
    controller.specialReplaceZerosValue(product);
  }
  for (final product in specialExpressProducts) {
    controller.specialReplaceZerosValue(product);
  }
  for (final product in specialSuperExpressProducts) {
    controller.specialReplaceZerosValue(product);
  }
  for (final product in othersNormalProducts) {
    controller.othersReplaceZerosValue(product);
  }
  for (final product in othersExpressProducts) {
    controller.othersReplaceZerosValue(product);
  }
  for (final product in othersSuperExpressProducts) {
    controller.othersReplaceZerosValue(product);
  }
  for (final product in beddingNormalProducts) {
    controller.beddingReplaceZerosValue(product);
  }
  for (final product in beddingExpressProducts) {
    controller.beddingReplaceZerosValue(product);
  }
  for (final product in beddingSuperExpressProducts) {
    controller.beddingReplaceZerosValue(product);
  }
  for (final product in bathNormalProducts) {
    controller.bathReplaceZerosValue(product);
  }
  for (final product in bathExpressProducts) {
    controller.bathReplaceZerosValue(product);
  }
  for (final product in bathSuperExpressProducts) {
    controller.bathReplaceZerosValue(product);
  }
  for (final product in accessoriesNormalProducts) {
    controller.accessoriesReplaceZerosValue(product);
  }
  for (final product in accessoriesExpressProducts) {
    controller.accessoriesReplaceZerosValue(product);
  }
  for (final product in accessoriesSuperExpressProducts) {
    controller.accessoriesReplaceZerosValue(product);
  }
}

void performAllButtonBySuExpressCounter(List<Product> allProducts) {
  final clothesSuperExpressProducts = allProducts.where((p) => p.cat == 'Clothes' && p.type == 'super express').toList();
  final specialSuperExpressProducts = allProducts.where((p) => p.cat == 'Special' && p.type == 'super express').toList();
  final accessoriesSuperExpressProducts = allProducts.where((p) => p.cat == 'Accessories' && p.type == 'super express').toList();
  final beddingSuperExpressProducts = allProducts.where((p) => p.cat == 'Bedding' && p.type == 'super express').toList();
  final othersSuperExpressProducts = allProducts.where((p) => p.cat == 'Others' && p.type == 'super express').toList();
  final bathSuperExpressProducts = allProducts.where((p) => p.cat == 'Bath' && p.type == 'super express').toList();
  for (final product in clothesSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
  for (final product in specialSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
  for (final product in othersSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
  for (final product in beddingSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
  for (final product in bathSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
  for (final product in accessoriesSuperExpressProducts) {
    controller.performButtonBySuExpressCounter(product);
  }
}

Future<List<Product>> fetchAllProducts() async {
  final snapshot = await FirebaseFirestore.instance.collection('products').get();
  return snapshot.docs
      .map((doc) => Product.fromFirestore(doc.data()))
      .toList();
}

class CartTotalSum extends StatelessWidget {
  const CartTotalSum({super.key});

  @override
  Widget build(BuildContext context) {

    void goToCartBill(List<Product> allProducts){
      try {
        replaceAllZeroValue(allProducts);
        controller.ifSuExpress();
        controller.ifRemise();
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (builder) => CartBill()));
      } catch (e, s) {
        print('Error in goToCartBill: $e\n$s');
        // Optionally show a snackbar or dialog
      }
  }

    void goToShopPage() {
      controller.initRemise;

      controller.productasclothes.clear();
      controller.productaspecial.clear();
      controller.productasaccessories.clear();
      controller.productasbath.clear();
      controller.productasbedding.clear();
      controller.productasothers.clear();

      controller.generalListing.clear();

      controller.clothesnumber.clear();
      controller.specialnumber.clear();
      controller.othersnumber.clear();
      controller.beddingnumber.clear();
      controller.accessoriesnumber.clear();
      controller.bathnumber.clear();
      initAllRealCounters;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (builder) => const Articles()));
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          children: [
            FutureBuilder<List<Product>>(
              future: fetchAllProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final allProducts = snapshot.data!;
                print('Tous les produits Firestore:');
                for (final p in allProducts) {
                  print('cat=${p.cat}, type=${p.type}, id=${p.id}');
                }
                return ElevatedButton(
                  onPressed: () => goToCartBill(allProducts),
                  // () {
                  //   Navigator.of(context)
                  //   .push(MaterialPageRoute(builder: (builder) => CartBill()));
                  //   replaceAllZeroValue(allProducts);
                  //   controller.ifSuExpress();
                  //   controller.ifRemise();
                  // },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: eclatColor,
                  fixedSize: const Size(200.0, 55.0)),
                  child: const Text("GENERER LA FACTURE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black,),
                    ));
              },
            ),
            const SizedBox(
              height: 10.0,
            ),

            RichText(
                text: TextSpan(
              style: const TextStyle(color: Colors.red, fontSize: 16.0),
              text: 'Ou annuler et revenir à la  ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = goToShopPage,
                  text: "page d'accueil",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}