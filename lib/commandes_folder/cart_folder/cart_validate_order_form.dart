// ignore: depend_on_referenced_packages
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/database.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../cart_folder/topay_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import '../catalog_product/products_model_list.dart';
import 'cart_controller.dart';

final userr = FirebaseAuth.instance.currentUser!;
int i = 0;

class Validation extends StatelessWidget {
  const Validation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: eclatColor,
          title: const Center(
              // child: Text('Que voulez-vous laver ?')
              child: Text('Valider sa commande')),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: const [
                //CartTotalSum(),
                ValidateOrder(),
              ],
            ),
          ),
        ));
  }
}

class ValidateOrder extends StatefulWidget {
  const ValidateOrder({super.key});

  @override
  State<ValidateOrder> createState() => _ValidateOrderState();
}

class _ValidateOrderState extends State<ValidateOrder> {
  final CartController controller = Get.find();
  DatabaseService database = DatabaseService(uid: userr.uid);
  late final email = userr.email;
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
      // showDialog(
      //   context: context,
      //   barrierDismissible: true,
      //   builder: (context) => const Center(child: CircularProgressIndicator()),
      // );
      //controller.productasclothes.length
      //pour cloth
      _timer?.cancel();
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      // ignore: avoid_print
      print('EasyLoading show');

      for (i = 0; i < controller.productasclothes.keys.toList().length; i++) {
        Product productaClothes = controller.productasclothes.keys.toList()[i];
        Future createClothes({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docTester = FirebaseFirestore.instance.collection('orders').doc(
              //"${user?.phoneNumber} - ${controller.productasclothes.values.toList()[i]} ${productaClothes.nameproduct}");
              "$email - ${controller.productasclothes.values.toList()[i]} ${productaClothes.nameproduct}");
          final papson = {
            'email': email,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          //await docTester.set(papson);
          try {
            await docTester.set(papson, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productasclothes.values.toList()[i] != 0) {
          await createClothes(
            email: email,
            pathPhotograph: productaClothes.photo,
            leproduit: productaClothes.nameproduct,
            laquantite: controller.productasclothes.values.toList()[i],
            leprix: productaClothes.price,
          );
        } else {}
      }

      //special
      for (i = 0; i < controller.productaspecial.keys.toList().length; i++) {
        Product productaSpecial = controller.productaspecial.keys.toList()[i];
        Future createSpecial({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docspeTester = FirebaseFirestore.instance.collection('orders').doc(
              "$email - ${controller.productaspecial.values.toList()[i]} ${productaSpecial.nameproduct}");
          final papsons = {
            'email': email,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          try {
            await docspeTester.set(papsons, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productaspecial.values.toList()[i] != 0) {
          await createSpecial(
            email: email,
            pathPhotograph: productaSpecial.photo,
            leproduit: productaSpecial.nameproduct,
            laquantite: controller.productaspecial.values.toList()[i],
            leprix: productaSpecial.price,
          );
        } else {}
      }

      for (i = 0;
          i < controller.productasaccessories.keys.toList().length;
          i++) {
        Product productaAccessory =
            controller.productasaccessories.keys.toList()[i];
        Future createAccessory({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docsacTester = FirebaseFirestore.instance.collection('orders').doc(
              "$email - ${controller.productasaccessories.values.toList()[i]} ${productaAccessory.nameproduct}");
          final papsona = {
            'email': email,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          try {
            await docsacTester.set(papsona, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productasaccessories.values.toList()[i] != 0) {
          await createAccessory(
            email: email,
            pathPhotograph: productaAccessory.photo,
            leproduit: productaAccessory.nameproduct,
            laquantite: controller.productasaccessories.values.toList()[i],
            leprix: productaAccessory.price,
          );
        } else {}
      }

      for (i = 0; i < controller.productasbath.keys.toList().length; i++) {
        Product productaBath = controller.productasbath.keys.toList()[i];
        Future createBath({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docsbaTester = FirebaseFirestore.instance.collection('orders').doc(
              "$email - ${controller.productasbath.values.toList()[i]} ${productaBath.nameproduct}");
          final papsonba = {
            'email': email,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          try {
            await docsbaTester.set(papsonba, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productasbath.values.toList()[i] != 0) {
          await createBath(
            email: email,
            pathPhotograph: productaBath.photo,
            leproduit: productaBath.nameproduct,
            laquantite: controller.productasbath.values.toList()[i],
            leprix: productaBath.price,
          );
        } else {}
      }

      for (i = 0; i < controller.productasbedding.keys.toList().length; i++) {
        Product productaBedding = controller.productasbedding.keys.toList()[i];
        Future createBedding({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docsbeTester = FirebaseFirestore.instance.collection('orders').doc(
              "$email - ${controller.productasbedding.values.toList()[i]} ${productaBedding.nameproduct}");
          final papsonbe = {
            'email': email,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          try {
            await docsbeTester.set(papsonbe, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productasbedding.values.toList()[i] != 0) {
          await createBedding(
            email: email,
            pathPhotograph: productaBedding.photo,
            leproduit: productaBedding.nameproduct,
            laquantite: controller.productasbedding.values.toList()[i],
            leprix: productaBedding.price,
          );
        } else {}
      }

      for (i = 0; i < controller.productasothers.keys.toList().length; i++) {
        Product productaOther = controller.productasothers.keys.toList()[i];
        Future createOther({
          required String? email,
          required String pathPhotograph,
          required String leproduit,
          required int laquantite,
          required double leprix,
        }) async {
          // final docUser = FirebaseFirestore.instance.collection('usersdata').doc(user.uid);
          final docsoTester = FirebaseFirestore.instance.collection('orders').doc(
              "$email - ${controller.productasothers.values.toList()[i]} ${productaOther.nameproduct}");
          final papsono = {
            'email': email,
            'Location': location,
            'photoPath': pathPhotograph,
            "Nom de l'artcile": leproduit,
            'Quantité commandée': laquantite,
            'Coût unitaire': leprix,
            //'Total': "${controller.totalclothe}",
          };
          try {
            await docsoTester.set(papsono, SetOptions(merge: true));
          } on FirebaseAuthException catch (e) {
            // ignore: avoid_print
            print(e);

            print(e.message);
          }
          //final json = orders.toJsonOrders();
          //await docOrders.set({json}, SetOptions(merge: true));
        }

        if (controller.productasothers.values.toList()[i] != 0) {
          await createOther(
            email: email,
            pathPhotograph: productaOther.photo,
            leproduit: productaOther.nameproduct,
            laquantite: controller.productasothers.values.toList()[i],
            leprix: productaOther.price,
          );
        } else {}
      }
      _timer?.cancel();
      await EasyLoading.dismiss();
      // ignore: avoid_print
      print('EasyLoading dismiss');
      //Navigator.of(context).pop;
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (builder) => Buy()));
    }

    void goToShopPageBis() {
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
            )),
          ],
        ));
  }
}
