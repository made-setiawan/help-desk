// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:help_desk/components/button.dart';
import 'package:help_desk/components/text_field.dart';

class MyRegisterPage extends StatefulWidget {
  final Function()? onTap;
  const MyRegisterPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Image.asset(
                    "assets/images/User.png",
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fill,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //lets create
                  const Center(
                    child: Text("Lets create an account for you"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: emailTextController,
                      hintText: 'Email',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: signUp,
                    text: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  signUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // make sure passwords match

    if (passwordTextController.text != confirmPasswordTextController.text) {
      //pop loading circle
      Navigator.pop(context);
      displayMessage("Password don't match!");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      displayMessage(e.code);
    }
  }
}
