// import 'package:cloud_firestore/cloud_firestore.dart';
import '../home_folder/navigation_drawer.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'home_archives_screen.dart';
import '../commandes_folder/home_commandes_screen.dart';

Color eclatColor = const Color(0xFF5ACC80);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeView createState() => HomeView();
}

class HomeView extends State<Home> {
  int index = 0;
  // final userr = UserPreferences.myUser;

  final screens = const [
    HomeOrders(),
    HomeArchives(),
  ];

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
      drawer: const MyNavigationDrawer(),
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(
            // child: Text('Que voulez-vous laver ?')
            child: Text('Espace Kong Admin')),
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
              icon: Icon(Icons.receipt_long),
              label: 'Commandes',
            ),
            NavigationDestination(
              icon: Icon(Icons.archive),
              label: 'Archives',
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
