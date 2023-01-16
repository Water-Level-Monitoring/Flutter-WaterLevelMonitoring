import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_waterlevel/view/home_screen.dart';
import 'package:flutter_waterlevel/view/login_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 4, milliseconds: 350), () => checkUser());
    });
    super.initState();
  }

  Future checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');
    print(user);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/splash_ani.json',
              width: 220, height: 220, fit: BoxFit.fill),
          const Text(
            'W a t e r y',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    ));
  }
}
