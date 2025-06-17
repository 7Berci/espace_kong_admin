import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'cart_bill.dart';
import 'cart_controller.dart';

class NdBillGenertor extends StatelessWidget {
  final email;
  final ville;
  final quartier;
  NdBillGenertor({
    super.key,
    required this.ville,
    required this.quartier,
    required this.email,
  });

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // void callFunction() {
    //   controller.realIfSuExpress();
    //   controller.ifSuExpress();
    // }

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
              //"Le total des forRemises est : ${controller.printUpTotalOfRemise}",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
          ),
          const SizedBox(height: 21.0),
          ElevatedButton(
            onPressed: () {
              controller.ifRemise();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (builder) => CartBill(
                        email: email,
                        ville: ville,
                        quartier: quartier,
                      ),
                ),
              );
              //callFunction()
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: eclatColor,
              fixedSize: const Size(100.0, 55.0),
            ),
            // onPressed: () => Get.to(() => CartScreen()),
            // color: eclatColor,
            // height: 55.0,
            child: const Text(
              "GENERATEUR DE FACTURE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
          // MaterialButton(
          //   onPressed: () => [
          //     //controller.ifSuExpress();
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (builder) => CartBill())),
          //     callFunction()
          //   ],

          //   // onPressed: () => Get.to(() => CartScreen()),
          //   color: eclatColor,
          //   height: 55.0,
          //   child: const Text(
          //     "GENERATEUR DE FACTURE",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 14.0,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
