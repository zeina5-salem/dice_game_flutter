import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  const Dice({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    const diceIcons = [
      Icons.looks_one,
      Icons.looks_two,
      Icons.looks_3,
      Icons.looks_4,
      Icons.looks_5,
      Icons.looks_6,
    ];

    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFD2B4FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(diceIcons[value - 1], size: 48, color: Colors.black),
    );
  }
}
