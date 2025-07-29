// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/database.dart';
import 'package:espace_kong_admin/commandes_folder/home_commandes_screen.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../cart_folder/topay_screen.dart';
import '../catalog_product_wash/products_model_list.dart';
import 'cart_controller.dart';

final userr = FirebaseAuth.instance.currentUser!;
int i = 0;
final orderId = Uuid().v4();

class Validation extends StatelessWidget {
  final email;
  final ville;
  final quartier;
  final nbrArticles;
  final totalSansLivraison;
  final fraisLivraison;
  final totalWithLivraison;
  final remiseTen;
  final remiseTwenty;
  final remiseManuelle;
  final totalFinal;
  final fraisAdditionnel;
  const Validation({
    super.key,
    required this.nbrArticles,
    required this.ville,
    required this.quartier,
    required this.email,
    required this.totalSansLivraison,
    required this.fraisLivraison,
    required this.totalWithLivraison,
    required this.remiseTen,
    required this.remiseTwenty,
    required this.remiseManuelle,
    required this.fraisAdditionnel,
    required this.totalFinal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(
          // child: Text('Que voulez-vous laver ?')
          child: Text('Valider sa commande'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              //CartTotalSum(),
              ValidateOrder(
                email: email,
                ville: ville,
                quartier: quartier,
                nbrArticles: nbrArticles,
                totalSimple: totalSansLivraison,
                fraisLivraison: fraisLivraison,
                totalWithLivraison: totalWithLivraison,
                remiseTen: remiseTen,
                remiseTwenty: remiseTwenty,
                remiseManuelle: remiseManuelle,
                fraisAdditionnel: fraisAdditionnel,
                totalAvecRemise: totalFinal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValidateOrder extends StatefulWidget {
  final email;
  final ville;
  final quartier;
  final nbrArticles;
  final totalSimple;
  final fraisLivraison;
  final totalWithLivraison;
  final remiseTen;
  final remiseTwenty;
  final remiseManuelle;
  final totalAvecRemise;
  final fraisAdditionnel;
  const ValidateOrder({
    super.key,
    required this.email,
    required this.ville,
    required this.quartier,
    required this.nbrArticles,
    required this.totalSimple,
    required this.fraisLivraison,
    required this.totalWithLivraison,
    required this.remiseTen,
    required this.remiseTwenty,
    required this.remiseManuelle,
    required this.totalAvecRemise,
    required this.fraisAdditionnel,
  });

  @override
  State<ValidateOrder> createState() => _ValidateOrderState();
}

List<Map<String, dynamic>> articles = [];

void addProductsToArticles(Map<Product, int> productsMap) {
  productsMap.forEach((product, quantity) {
    if (quantity > 0) {
      articles.add({
        'photoPath': product.photo,
        "Nom de l'article": product.nameproduct,
        'Quantité commandée': quantity,
        'Coût unitaire': product.price,
        'Type': product.type,
      });
    }
  });
}

class _ValidateOrderState extends State<ValidateOrder> {
  final CartController controller = Get.find();
  DatabaseService database = DatabaseService(uid: userr.uid);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    EasyLoading.addStatusCallback((status) {
      // ignore: avoid_print
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future sendProducts() async {
      _timer?.cancel();
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      // ignore: avoid_print
      print('EasyLoading show');

      addProductsToArticles(
        Map<Product, int>.from(controller.productasclothes.value),
      );
      addProductsToArticles(
        Map<Product, int>.from(controller.productaspecial.value),
      );

      addProductsToArticles(
        Map<Product, int>.from(controller.productasaccessories.value),
      );
      addProductsToArticles(
        Map<Product, int>.from(controller.productasbath.value),
      );
      addProductsToArticles(
        Map<Product, int>.from(controller.productasbedding.value),
      );
      addProductsToArticles(
        Map<Product, int>.from(controller.productasothers.value),
      );

      try {
        await FirebaseFirestore.instance.collection('orders').doc(orderId).set({
          'email': widget.email,
          'ville': widget.ville,
          'quartier': widget.quartier,
          'articles': articles,
          'fraisLivraison': widget.fraisLivraison,
          'fraisAdditionnel': widget.fraisAdditionnel,
          'remises': {
            'ten': widget.remiseTen,
            'twenty': widget.remiseTwenty,
            'manuelle': widget.remiseManuelle,
          },
          'totalSansRemise': widget.totalSimple,
          'totalFinal': widget.totalAvecRemise,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      } on FirebaseAuthException catch (e) {
        // ignore: avoid_print
        print(e);

        print(e.message);
      }

      _timer?.cancel();
      await EasyLoading.dismiss();
      // ignore: avoid_print
      print('EasyLoading dismiss');
      //Navigator.of(context).pop;
      // ignore: use_build_context_synchronously
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (builder) => Buy()));
    }

    void goToShopPageBis() {
      //controller.initRemise;
      controller.theRemiseTen = 0.0;
      controller.theRemiseTwenty = 0.0;
      controller.remiseManuelle = 0.0 as RxDouble;
      controller.fraisAdditionnel = 0.0 as RxDouble;

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

      controller.addedSuExpress.clear();
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (builder) => HomeOrders()));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          MaterialButton(
            onPressed: sendProducts,
            // onPressed: () => Get.to(() => CartScreen()),
            color: Colors.yellow,
            height: 55.0,
            child: const Text(
              "VALIDER LA COMMANDE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.red, fontSize: 16),
              text: 'Ou annuler et revenir à la   ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = goToShopPageBis,
                  text: "page d'accueil",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
