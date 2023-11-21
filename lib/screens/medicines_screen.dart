import 'package:flutter/material.dart';

import '../utilities/medicine.dart';

class MedicinesScreen extends StatefulWidget {
  MedicinesScreen({super.key});

  String route = './medicines_screen';
  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  List<Medicine> medicines = [
    Medicine(
      medicineName: 'DIVYA MEDHA VATI',
      medicineImage: Image.asset('assets/images/headache/divya_meti.jpg'),
      company: 'Patanjali',
      price: 'Rs. 100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dawaiyaaa'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/medicine_detail_screen');
              },
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                  left: 20,
                  right: 20,
                ),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        medicines[index].medicineName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 204, 11, 204),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Image(
                      width: 200,
                      image: medicines[index].medicineImage.image,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        'Price ${medicines[index].price}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 204, 11, 204),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 0,
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        'By ${medicines[index].company}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 204, 11, 21),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: medicines.length),
    );
  }
}
