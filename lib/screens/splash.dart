import 'package:flutter/material.dart';
import 'package:help_desk/screens/login_page.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Help Desk",
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your customer doesn’t care how much you know until they know how much you care",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
                Lottie.asset('assets/lottie/help-desk.json'),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        },
                        child: const Text("Let's Start")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
