import 'package:ayurvedic_medicine/providers/message_history.dart';
import 'package:ayurvedic_medicine/screens/medicine_detail_screen.dart';
import 'package:ayurvedic_medicine/screens/medicines_screen.dart';
import 'package:ayurvedic_medicine/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './screens/homepage_screen.dart';
import './screens/chatbot_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create: (ctx) => MessageHistory(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ayu Veer',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (context) => const SplashScreen(),
          HomepageScreen.route: (context) => HomepageScreen(),
          ChatbotScreen.route: (context) => ChatbotScreen(),
          MedicinesScreen.route: (context) => MedicinesScreen(),
          MedicineDetailScreen.route: (context) => MedicineDetailScreen(),
        },
      ),
    );
  }
}
