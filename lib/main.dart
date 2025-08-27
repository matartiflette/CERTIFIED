import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_page.dart';
// ...tes imports existants...

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _signedUp;

  @override
  void initState() {
    super.initState();
    _checkSignup();
  }

  Future<void> _checkSignup() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _signedUp = prefs.getBool('signed_up') ?? false;
    });
  }

  void _onSignupComplete() {
    setState(() {
      _signedUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_signedUp == null) {
      return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
    }
    return MaterialApp(
      title: 'Bouton Top 1%',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: _signedUp!
          ? const PlaceholderPage()
          : SignupPage(onSignupComplete: _onSignupComplete),
    );
  }
} // <-- Fin de _MyAppState

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: const Center(child: Text('Bienvenue !')),
    );
  }
}