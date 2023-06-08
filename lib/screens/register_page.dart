import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_desk/screens/login_page.dart';

import '../components/passwordfield.dart';
import 'fireauth.dart';
import 'profile_page.dart';
import 'validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerFormKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      // ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Form(
              key: registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/User.png',
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //lets create
                  const Center(
                    child: Text(
                      "Lets create an account for you",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFieldCust(
                    controllerText: nameTextController,
                    suffixIcon: Icons.person,
                    labelText: 'Name',
                    validator: (value) => Validator.validateName(
                      name: value,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Name is required';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFieldCust(
                    controllerText: emailTextController,
                    suffixIcon: Icons.mail,
                    labelText: 'Email',
                    validator: (value) => Validator.validateEmail(
                      email: value,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Email is required';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFieldCust(
                    controllerText: passwordTextController,
                    suffixIcon: Icons.visibility,
                    labelText: 'Password',
                    validator: (value) => Validator.validatePassword(
                      password: value,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Password is required';
                    //   }
                    //   return null;
                    // },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFieldCust(
                    controllerText: confirmPasswordTextController,
                    suffixIcon: Icons.visibility,
                    labelText: 'Confirm Password',
                    validator: (value) => Validator.validatePassword(
                      password: value,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Confirm Password is required';
                    //   }
                    //   return null;
                    // },
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    // color: Colors.black,
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                6.0), // Set the desired radius value here
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (registerFormKey.currentState!.validate()) {
                          User? user =
                              await FireAuth.registerUsingEmailPassword(
                            name: nameTextController.text,
                            email: emailTextController.text,
                            password: passwordTextController.text,
                          );

                          setState(() {
                            isProcessing = false;
                          });

                          if (user != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(user: user),
                              ),
                              ModalRoute.withName('/'),
                            );
                          }

                          // Validasi sukses, lakukan tindakan selanjutnya
                          // seperti menyimpan data ke database, dll.
                          // ...
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize: 14),
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
}
