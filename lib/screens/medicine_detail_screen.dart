import 'package:flutter/material.dart';

class MedicineDetailScreen extends StatelessWidget {
  MedicineDetailScreen({super.key});

  String route = '/medicine_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TextBlock(text: 'Divya Medha Vati'),
            const TextBlock(text: 'By Patanjali'),
            Image(
              image: Image.asset('assets/images/headache/divya_meti.jpg').image,
            ),
            const TextBlock(text: 'Rs. 100'),
            const TextBlock(text: 'Ingredients: '),
            const TextBlock(text: 'Description:'),
          ],
        ),
      ),
    );
  }


}

class TextBlock extends StatelessWidget {
  final String? text;
  const TextBlock({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child:  Text(
        text!,
        style: const TextStyle(
          color: Color.fromARGB(255, 204, 11, 101),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}


