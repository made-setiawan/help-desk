import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_desk/auth/login_or_register.dart';
import 'package:help_desk/screens/myhome.dart';

class MyAuthPage extends StatelessWidget {
  final bool _isLoading = false;

  const MyAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyHomePage();
          } else {
            // return const MyLoginOrRegister();
            return _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const MyLoginOrRegister();
          }
        },
      ),
    );
  }
}
