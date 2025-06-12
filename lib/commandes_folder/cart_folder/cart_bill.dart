import 'package:espace_kong_admin/home_folder/home.dart';
import "package:flutter/material.dart";
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'cart_controller.dart';
import 'cart_validate_order_form.dart';

class CartBill extends StatelessWidget {
  CartBill({super.key});
  final TextEditingController remiseController = TextEditingController();
  final CartController controller = Get.find();
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
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "${controller.shipping} FCFA",
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
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
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                ),
                Text(
                  "${controller.printTheRemiseTen} FCFA",
                  style: const TextStyle(
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
                  "Remise +20 articles",
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                ),
                Text(
                  "${controller.printTheRemiseTwenty} FCFA",
                  style: const TextStyle(
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
                  "Total sans remise",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
                Text(
                  "${controller.realTotal - controller.theRemiseTen - controller.theRemiseTwenty + controller.shipping} FCFA",
                  //"${controller.realTotal - theRemiseTen - theRemiseTwenty + controller.shipping} FCFA",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            // Champ de remise manuelle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Remise manuelle",
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: remiseController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "0 FCFA",
                    ),
                    onChanged: (val) {
                      double value = double.tryParse(val) ?? 0.0;
                      controller.remiseManuelle.value = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Obx(() => Row(
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
            )),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (builder) => const Validation()));
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
      )),
    );
  }
}
