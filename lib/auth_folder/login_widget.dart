import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgotpassword_page.dart';
// ignore: import_of_legacy_library_into_null_safe

class LoginWidget extends StatefulWidget {

  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Utils utilsWidget = Utils();
  String takeValue = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool activeButton = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 160.0),
              const Text(
                "Bon retour !",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: emailController,
                // cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  takeValue = value;
                  setState(() {});
                },
                validator: (String? value) {
                  if (value != "aaron7berci@gmail.com") {
                    //if (value == null || value.isEmpty) {
                    return 'Etes-vous un admin ?';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: passwordController,
                // cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed:
                    // () {
                    //   if (takeValue == "afrikeclat@gmail.com") {
                    //     signInAdmin;
                    //   } else {}
                    // },
                    // onPressed: activeButton ? null : signInAdmin,
                    // onPressed: takeValue.length < 20 ? null : signInAdmin,
                    takeValue != "aaron7berci@gmail.com" ? null : signIn,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50.0),
                ),
                icon: const Icon(Icons.lock_open, size: 32.0),
                label: const Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              const SizedBox(height: 24.0),
              const SizedBox(height: 24),
              GestureDetector(
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage())),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('showHome', true);
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (builder) => Home()),
    );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Navigator.of(context).pop();
      utilsWidget.showSnackBar(e.message);
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (builder) => Home()));
  }
}
