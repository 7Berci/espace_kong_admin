import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:espace_kong_admin/auth_folder/login_widget.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_folder/utils.dart';
import 'themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR');
  try {
    // Initialize Firebase directly here
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyD5wrPW55rS9pc_fcrU0yu4LnjB_5K0zGw",
          authDomain: "espace-kong.firebaseapp.com",
          projectId: "espace-kong",
          storageBucket: "espace-kong.firebasestorage.app",
          messagingSenderId: "635951895712",
          appId: "1:635951895712:web:37985cab89d87d61e325c5",
          measurementId: "G-W0TNQYPB5S",
        ),
      );
    }

    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;

    configLoading();
    runApp(MyApp(showHome: showHome));
  } catch (e) {
    print("Firebase initialization error: $e");
    // Fallback to run app without Firebase if initialization fails
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Failed to initialize Firebase: $e')),
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

final navigatorKey = GlobalKey<NavigatorState>();

//Stateless du MaterialApp
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final bool showHome;

  MyApp({super.key, required this.showHome});
  static const String title = "Espace Kong Admin";
  // final userr = UserPreferences.myUser;
  Utils utilsInstance = Utils();

  @override
  Widget build(BuildContext context) => ThemeProvider(
    // initTheme: userr.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
    initTheme: MyThemes.lightTheme,
    child: Builder(
      builder:
          (context) => MaterialApp(
            scaffoldMessengerKey: utilsInstance.messengerKey,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            // theme: ThemeProvider.of(context),
            // theme: userr.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
            theme: MyThemes.lightTheme,
            title: title,
            home: showHome ? Home() : const LoginWidget(),
            builder: EasyLoading.init(),
            // routes: {
            //   '/ajouter_articles': (context) => Articles(""),
            //   '/changer_statut': (context) => Statut(),
            //   // ... autres routes
            // },
          ),
    ),
  );
}
