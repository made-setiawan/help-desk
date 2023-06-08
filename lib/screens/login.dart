// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:help_desk/components/button.dart';
import 'package:help_desk/components/text_field.dart';

class MyLoginPage extends StatefulWidget {
  final Function()? onTap;
  const MyLoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                //logo
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Image.asset(
                    'assets/images/Lock.png',
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //welcome back
                  const Text(
                    "Welcome back, you've been missed!",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //username textfield
                  MyTextField(
                      controller: emailTextController,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
                  MyTextField(
                      controller: passwordTextController,
                      hintText: 'Password',
                      obscureText: true),
                  //forgot password
                  const SizedBox(
                    height: 25,
                  ),
                  //sign in button

                  MyButton(onTap: signIn, text: 'Sign In'),

                  //or continue with
                  const SizedBox(
                    height: 10,
                  ),
                  //google + apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //not member
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('errrr${e.code}');
        // displayMessage(e.code);
      }
      //pop loading circle
      Navigator.pop(context);
      //display
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }
}
