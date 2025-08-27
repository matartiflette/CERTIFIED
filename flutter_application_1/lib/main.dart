import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bouton Top 1%',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TopOnePercentPage(),
    );
  }
}

class TopOnePercentPage extends StatelessWidget {
  const TopOnePercentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 1%'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {print('Bouton pressé !');},
          child: const Text('Je paie 999 \$, je suis du top 1 %'),
        ),
      ),
    );
  }
}