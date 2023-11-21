import 'package:flutter/material.dart';

import '../screens/medicines_screen.dart';

class RogWidget extends StatelessWidget {
  final String? name;
  const RogWidget({
    this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MedicinesScreen().route);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
