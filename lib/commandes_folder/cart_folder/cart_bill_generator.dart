import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_bill.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'cart_controller.dart';

class BillGenertor extends StatelessWidget {
  final email;
  BillGenertor({super.key, required this.email});

  //final CartController controller = Get.find();
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Générateur de facture'),
        backgroundColor: eclatColor,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Cliquez sur le bouton pour générer votre facture",
              style: TextStyle(fontSize: 21.0),
            ),
          ),
          const SizedBox(height: 21.0),

          MaterialButton(
            //ElevatedButton(
            onPressed: () {
              controller.ifRemise();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (builder) => CartBill(email: email)),
              );
              replaceAllZeroValue;
            },
            color: eclatColor,
            height: 55.0,
            child: const Text(
              "GENERATEUR DE FACTURE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
