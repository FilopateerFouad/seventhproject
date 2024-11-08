import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seventhproject/loginscreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cp) {
        return const Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/welcomescreen.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
    )));
  }
}
