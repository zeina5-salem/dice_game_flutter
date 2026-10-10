import 'dart:math';

import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "playDice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: playDice(),
    );
  }
}

class playDice extends StatefulWidget {
  const playDice({super.key});

  @override
  State<playDice> createState() => playDiceState();
}

class playDiceState extends State<playDice> {
  int value_1 = 1;
  int value_2 = 1;
  int total = 2;

  void reset() {
    setState(() {
      value_1 = 1;
      value_2 = 1;
      total = 2;
    });
  }

  void roll() {
    setState(() {
      value_1 = Random().nextInt(6) + 1;
      value_2 = Random().nextInt(6) + 1;
      total = value_1 + value_2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Dice'),
        centerTitle: true,
        leading: const Icon(Icons.casino),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              "Total is $total",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              total >= 8 ? 'assets/happy.png' : 'assets/sad.png',
              width: 150,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            SizedBox(height: 50),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: value_1),
                Dice(value: value_2),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: roll, child: Text("Roll")),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(onPressed: reset, child: Text("Reset")),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
