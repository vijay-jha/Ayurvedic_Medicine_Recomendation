import 'package:ayurvedic_medicine/screens/medicine_detail_screen.dart';
import 'package:ayurvedic_medicine/screens/medicines_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayu Veer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomepageScreen().route,
      routes: {
        HomepageScreen().route: (context) => HomepageScreen(),
        ChatbotScreen().route: (context) => ChatbotScreen(),
        MedicinesScreen().route: (context) => MedicinesScreen(),
        MedicineDetailScreen().route: (context) => MedicineDetailScreen(),
      },
    );
  }
}
