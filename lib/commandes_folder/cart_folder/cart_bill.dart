import 'package:espace_kong_admin/home_folder/home.dart';
import "package:flutter/material.dart";
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'cart_controller.dart';
import 'cart_validate_order_form.dart';

class CartBill extends StatefulWidget {
  final email;
  const CartBill({super.key, required this.email});

  @override
  State<CartBill> createState() => _CartBillState();
}

class _CartBillState extends State<CartBill> {
  final TextEditingController remiseController = TextEditingController();

  final CartController controller = Get.find();

  String nbrArticles = "0";
  double totalSansLivraison = 0;
  double fraisLivraison = 0;
  String totalWithLivraison = "0";
  double remiseTen = 0;
  double remiseTwenty = 0;
  double remiseManuelle = 0;
  double totalFinal = 0;

  @override
  void initState() {
    super.initState();
    // Initialiser le nombre d'articles
    nbrArticles = controller.totalOfArticles.toString();
    // // Mettre à jour le nombre d'articles si nécessaire
    // controller.totalOfArticles.listen((value) {
    //   setState(() {
    //     nbrArticles = value.toString();
    //   });
    // });
    totalSansLivraison = controller.printTotal;
    // controller.printTotal.listen((value) {
    //   setState(() {
    //     totalSimple = "${value} FCFA";
    //   });
    // });

    fraisLivraison = controller.shipping;
    totalWithLivraison = "${controller.shipping + controller.realTotal} FCFA";

    remiseTen = controller.printTheRemiseTen;
    // controller.printTheRemiseTen.listen((value) {
    //   setState(() {
    //     remiseTen = "${value} FCFA";
    //   });
    // });
    remiseTwenty = controller.printTheRemiseTwenty;
    // controller.printTheRemiseTwenty.listen((value) {
    //   setState(() {
    //     remiseTwenty = "${value} FCFA";
    //   });
    // });
    remiseManuelle = controller.remiseManuelle.value;
    totalFinal =
        controller.realTotal -
        controller.theRemiseTen -
        controller.theRemiseTwenty +
        controller.shipping -
        controller.remiseManuelle.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MA FACTURE'),
        backgroundColor: eclatColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Nombre d'articles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    // "${controller.globalsom} FCFA",
                    "${controller.totalOfArticles}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Article(s) Super Express ?",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "${controller.printIfCinqMilles} FCFA",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    // "${controller.globalsom} FCFA",
                    "${controller.printTotal} FCFA",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Frais de livraison",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "${controller.shipping} FCFA",
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Total + livraison",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                    ),
                  ),
                  Text(
                    "${controller.shipping + controller.realTotal} FCFA",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Remise +10 articles",
                    style: TextStyle(fontSize: 19.0),
                  ),
                  Text(
                    "${controller.printTheRemiseTen} FCFA",
                    style: const TextStyle(fontSize: 19.0),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Remise +20 articles",
                    style: TextStyle(fontSize: 19.0),
                  ),
                  Text(
                    "${controller.printTheRemiseTwenty} FCFA",
                    style: const TextStyle(fontSize: 19.0),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     const Text(
              //       "Total sans remise",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 21.0,
              //       ),
              //     ),
              //     Text(
              //       "${controller.realTotal - controller.theRemiseTen - controller.theRemiseTwenty + controller.shipping} FCFA",
              //       //"${controller.realTotal - theRemiseTen - theRemiseTwenty + controller.shipping} FCFA",
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 21.0,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 4.0),
              // Champ de remise manuelle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Remise manuelle",
                    style: TextStyle(fontSize: 19.0),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: remiseController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "0 FCFA"),
                      onChanged: (val) {
                        double value = double.tryParse(val) ?? 0.0;
                        controller.remiseManuelle.value = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total avec remise",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      "${controller.realTotal - controller.theRemiseTen - controller.theRemiseTwenty + controller.shipping - controller.remiseManuelle.value} FCFA",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder:
                          (builder) => Validation(
                            email: widget.email,
                            nbrArticles: nbrArticles,
                            totalSansLivraison: totalSansLivraison,
                            fraisLivraison: fraisLivraison,
                            totalWithLivraison: totalWithLivraison,
                            remiseTen: remiseTen,
                            remiseTwenty: remiseTwenty,
                            remiseManuelle: remiseManuelle,
                            totalFinal: totalFinal,
                          ),
                    ),
                  );
                },
                // onPressed: () => Get.to(() => CartScreen()),
                color: Colors.yellow,
                height: 55.0,
                child: const Text(
                  "PROCEDER A LA VALIDATION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
