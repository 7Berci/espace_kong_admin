import 'package:espace_kong_admin/commandes_folder/ajouter_express_screen.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_normal_screen.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_superexpress_screen.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_total.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
import 'cart_folder/cart_controller.dart';
import 'cart_folder/cart_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  ArticlesView createState() => ArticlesView();
}

class ArticlesView extends State<Articles> {
  int index = 0;
  // final userr = UserPreferences.myUser;

  final screens = const [
    AjouterNormal(),
    AjouterExpress(),
    AjouterSuperExpress(),
  ];

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(
            // child: Text('Que voulez-vous laver ?')
            child: Text('Ajouter des articles')),
      ),
      
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.green,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          height: 60.0,
          backgroundColor:
              // userr.isDarkMode ? Colors.grey.shade900 : Colors.white,
              Colors.white,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.delivery_dining),
              label: 'Normal',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_shipping),
              label: 'Express',
            ),
            NavigationDestination(
              icon: Icon(Icons.motorcycle),
              label: 'Super Express',
            ),
          ],
        ),
      ),
      //     ),
      //   ),
      // ),
    );
  }
}

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  final cartControlla = Get.put(CartController());
  bool changeIcon = true;

void navigateToNewPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AjouterNormal()),
  );
}





  @override
  Widget build(BuildContext context) {
    void activateOnPressed() {
      if (cartControlla.isCartEmpty()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text('Aucun produit sélectionné dans le panier.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Ferme la popup
                  },
                ),
              ],
            );
          },
        );
      } else {
        performAllButtonBySuExpressCounter;
        initAllrkValue;
      }
    }

    return Center(
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              if (cartControlla.isCartEmpty()) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erreur'),
                        content: Text(
                            'Aucun produit sélectionné dans le panier. Veuillez sélectionné un produit'),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'))
                        ],
                      );
                    });
              } else {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (builder) => CartScreen()));
                activateOnPressed();
                // cartControlla.realIfSuExpress(),
                // cartControlla.ifSuExpress(),
                cartControlla.ifsigned();
              }
            },
            color: Colors.yellow,
            height: 55.0,
            child: const Text(
              "AJOUTER CES ARTICLES",
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