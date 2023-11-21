import 'package:ayurvedic_medicine/screens/chatbot_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/rog_widget.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});
  String route = '/homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayu-Veer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: const [
                RogWidget(
                  name: 'डोकेदुखी',
                ),
                RogWidget(
                  name: 'खोकला',
                ),
                RogWidget(
                  name: 'सर्दी',
                ),
                RogWidget(
                  name: 'पोटदुखी',
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ChatbotScreen().route);
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade200,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(30),
                  right: Radius.circular(30),
                ),
              ),
              child: const Center(
                child: Text('ChatieBottie'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
