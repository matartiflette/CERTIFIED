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

class TopOnePercentPage extends StatefulWidget {
  const TopOnePercentPage({super.key});

  @override
  State<TopOnePercentPage> createState() => _TopOnePercentPageState();
}

class _TopOnePercentPageState extends State<TopOnePercentPage> {
  String dropdownValue = 'Choix 1';

// ...existing code...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 1%'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Choix 1'),
              onTap: () {
                setState(() {
                  dropdownValue = 'Choix 1';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Choix 2'),
              onTap: () {
                setState(() {
                  dropdownValue = 'Choix 2';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Choix 3'),
              onTap: () {
                setState(() {
                  dropdownValue = 'Choix 3';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Bouton pressé !');
          },
          child: Text('Je paie 999 \$, je suis du top 1 % (${dropdownValue})'),
        ),
      ),
    );
  }
}