import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:espace_kong_admin/commandes_folder/home_commandes_screen.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'cart_controller.dart';

class Buy extends StatelessWidget {
  final cartController = Get.put(CartController());
  Buy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(
            // child: Text('Que voulez-vous laver ?')
            child: Text('Commande passée')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Buy()));
              },
              icon: const Icon(Icons.call)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 34),
              Image.asset('assets/images/validate.png'),
              const SizedBox(height: 34),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "La commande a été enregistrée \n avec succès.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: MaterialButton(
                  onPressed: () {
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
                    cartController.initRemiseManuel;
                    initAllRealCounters;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => const HomeOrders()));
                  },
                  // onPressed: () => Get.to(() => CartScreen()),
                  color: Colors.yellow,
                  height: 55.0,
                  child: const Text(
                    "PAGE DE COMMANDES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
