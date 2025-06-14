import 'package:espace_kong_admin/commandes_folder/ajouter_express_screen.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_normal_screen.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_superexpress_screen.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  final String id;
  final String email;

  const Articles({super.key, required this.id, required this.email});

  @override
  ArticlesView createState() => ArticlesView();
}

class ArticlesView extends State<Articles> {
  late final List<Widget> screens;
  int index = 0;
  // // Récupération du document par ID
  // final document = await FirebaseFirestore.instance.collection('orders_users').doc(docs[index].id).get();

  // // Accès à l'email
  // final email = document['email'];

  @override
  void initState() {
    super.initState();
    screens = [
      AjouterNormal(id: widget.id, email: widget.email),
      AjouterExpress(id: widget.id, email: widget.email),
      AjouterSuperExpress(id: widget.id, email: widget.email),
    ];
    // Vous pouvez utiliser widget.email ici si nécessaire
    print('Email reçu : ${widget.email}');
  }

  // late final client_email = widget.email;

  // final screens = [
  //   AjouterNormal(email: widget.email),
  //   AjouterExpress(email: widget.email),
  //   AjouterSuperExpress(email: widget.email),
  // ];

  @override
  Widget build(BuildContext context) {
    // if (screens.isEmpty) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(
          // child: Text('Que voulez-vous laver ?')
          child: Text('Ajouter des articles'),
        ),
      ),

      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.green,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
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
