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
import '../catalog_product/products_model_list.dart';
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

      // for (i = 0; i < controller.productasclothes.keys.toList().length; i++) {
      //   Product productaClothes = controller.productasclothes.keys.toList()[i];
      //   Future createClothes({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           //"${user?.phoneNumber} - ${controller.productasclothes.values.toList()[i]} ${productaClothes.nameproduct}");
      //           "$email - ${controller.productasclothes.values.toList()[i]} ${productaClothes.nameproduct}",
      //         );
      //     final papson = {
      //       'email': email,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     //await docTester.set(papson);
      //     try {
      //       await docTester.set(papson, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productasclothes.values.toList()[i] != 0) {
      //     await createClothes(
      //       email: widget.email,
      //       pathPhotograph: productaClothes.photo,
      //       leproduit: productaClothes.nameproduct,
      //       laquantite: controller.productasclothes.values.toList()[i],
      //       leprix: productaClothes.price,
      //     );
      //   } else {}
      // }
      // //special
      // for (i = 0; i < controller.productaspecial.keys.toList().length; i++) {
      //   Product productaSpecial = controller.productaspecial.keys.toList()[i];
      //   Future createSpecial({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docspeTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           "$email - ${controller.productaspecial.values.toList()[i]} ${productaSpecial.nameproduct}",
      //         );
      //     final papsons = {
      //       'email': email,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     try {
      //       await docspeTester.set(papsons, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productaspecial.values.toList()[i] != 0) {
      //     await createSpecial(
      //       email: widget.email,
      //       pathPhotograph: productaSpecial.photo,
      //       leproduit: productaSpecial.nameproduct,
      //       laquantite: controller.productaspecial.values.toList()[i],
      //       leprix: productaSpecial.price,
      //     );
      //   } else {}
      // }
      // for (
      //   i = 0;
      //   i < controller.productasaccessories.keys.toList().length;
      //   i++
      // ) {
      //   Product productaAccessory =
      //       controller.productasaccessories.keys.toList()[i];
      //   Future createAccessory({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docsacTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           "$email - ${controller.productasaccessories.values.toList()[i]} ${productaAccessory.nameproduct}",
      //         );
      //     final papsona = {
      //       'email': email,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     try {
      //       await docsacTester.set(papsona, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productasaccessories.values.toList()[i] != 0) {
      //     await createAccessory(
      //       email: widget.email,
      //       pathPhotograph: productaAccessory.photo,
      //       leproduit: productaAccessory.nameproduct,
      //       laquantite: controller.productasaccessories.values.toList()[i],
      //       leprix: productaAccessory.price,
      //     );
      //   } else {}
      // }
      // for (i = 0; i < controller.productasbath.keys.toList().length; i++) {
      //   Product productaBath = controller.productasbath.keys.toList()[i];
      //   Future createBath({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docsbaTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           "$email - ${controller.productasbath.values.toList()[i]} ${productaBath.nameproduct}",
      //         );
      //     final papsonba = {
      //       'email': email,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     try {
      //       await docsbaTester.set(papsonba, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productasbath.values.toList()[i] != 0) {
      //     await createBath(
      //       email: widget.email,
      //       pathPhotograph: productaBath.photo,
      //       leproduit: productaBath.nameproduct,
      //       laquantite: controller.productasbath.values.toList()[i],
      //       leprix: productaBath.price,
      //     );
      //   } else {}
      // }
      // for (i = 0; i < controller.productasbedding.keys.toList().length; i++) {
      //   Product productaBedding = controller.productasbedding.keys.toList()[i];
      //   Future createBedding({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docsbeTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           "$email - ${controller.productasbedding.values.toList()[i]} ${productaBedding.nameproduct}",
      //         );
      //     final papsonbe = {
      //       'email': email,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     try {
      //       await docsbeTester.set(papsonbe, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productasbedding.values.toList()[i] != 0) {
      //     await createBedding(
      //       email: widget.email,
      //       pathPhotograph: productaBedding.photo,
      //       leproduit: productaBedding.nameproduct,
      //       laquantite: controller.productasbedding.values.toList()[i],
      //       leprix: productaBedding.price,
      //     );
      //   } else {}
      // }
      // for (i = 0; i < controller.productasothers.keys.toList().length; i++) {
      //   Product productaOther = controller.productasothers.keys.toList()[i];
      //   Future createOther({
      //     required String? email,
      //     required String pathPhotograph,
      //     required String leproduit,
      //     required int laquantite,
      //     required double leprix,
      //   }) async {
      //     // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
      //     final docsoTester = FirebaseFirestore.instance
      //         .collection('orders')
      //         .doc(
      //           "$email - ${controller.productasothers.values.toList()[i]} ${productaOther.nameproduct}",
      //         );
      //     final papsono = {
      //       'email': email,
      //       'Location': location,
      //       'photoPath': pathPhotograph,
      //       "Nom de l'artcile": leproduit,
      //       'Quantité commandée': laquantite,
      //       'Coût unitaire': leprix,
      //       //'Total': "${controller.totalclothe}",
      //     };
      //     try {
      //       await docsoTester.set(papsono, SetOptions(merge: true));
      //     } on FirebaseAuthException catch (e) {
      //       // ignore: avoid_print
      //       print(e);
      //       print(e.message);
      //     }
      //     //final json = orders.toJsonOrders();
      //     //await docOrders.set({json}, SetOptions(merge: true));
      //   }
      //   if (controller.productasothers.values.toList()[i] != 0) {
      //     await createOther(
      //       email: widget.email,
      //       pathPhotograph: productaOther.photo,
      //       leproduit: productaOther.nameproduct,
      //       laquantite: controller.productasothers.values.toList()[i],
      //       leprix: productaOther.price,
      //     );
      //   } else {}
      // }

      // try {
      //   // Référence à la collection "orders_total"
      //   final ordersCollection = FirebaseFirestore.instance.collection(
      //     'orders_total',
      //   );

      //   // Création du document avec les données
      //   await ordersCollection.add({
      //     'email': widget.email,
      //     'nbrArticles': widget.nbrArticles,
      //     'totalSimple': widget.totalSimple,
      //     'fraisLivraison': widget.fraisLivraison,
      //     'totalWithLivraison': widget.totalWithLivraison,
      //     'remiseTen': widget.remiseTen,
      //     'remiseTwenty': widget.remiseTwenty,
      //     'remiseManuelle': widget.remiseManuelle,
      //     'totalAvecRemise': widget.totalAvecRemise,
      //     'createdAt': FieldValue.serverTimestamp(), // Ajout d'un timestamp
      //   });

      //   print('Données envoyées avec succès dans la collection orders_total.');
      // } catch (e) {
      //   print('Erreur lors de l\'envoi des données : $e');
      // }

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
