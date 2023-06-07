import 'package:flutter/material.dart';
import 'package:help_desk/screens/login.dart';
import 'package:help_desk/screens/register.dart';

class MyLoginOrRegister extends StatefulWidget {
  const MyLoginOrRegister({super.key});

  @override
  State<MyLoginOrRegister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyLoginOrRegister> {
  //initially, show the login page
  bool showLoginPage = true;

//toggle between login and register page

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return MyLoginPage(onTap: togglePages);
    } else {
      return MyRegisterPage(onTap: togglePages);
    }
  }
}
