import 'dart:async';

import 'package:ayurvedic_medicine/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String route = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Timer startTimer() {
    Duration duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacementNamed(context, HomepageScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.45,
          image: AssetImage('assets/images/bg.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            child: Lottie.asset('assets/lottie/medicine_lottie.json'),
          ),
        ),
      ),
    );
  }
}
