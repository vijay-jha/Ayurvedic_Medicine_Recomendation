import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayu-Veer'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          CardWidget(
            name: 'डोकेदुखी',
          ),
          CardWidget(
            name: 'खोकला',
          ),
          CardWidget(
            name: 'सर्दी',
          ),
          CardWidget(
            name: 'पोटदुखी',
          ),
        ],
      ),
    );
  }
}
