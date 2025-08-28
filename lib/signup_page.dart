import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';


class SignupPage extends StatefulWidget {
  final VoidCallback onSignupComplete;
  const SignupPage({super.key, required this.onSignupComplete});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _saveSignup() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('signed_up', true);

    final userData = {
      'email': _mailController.text,
      'nom': _nameController.text,
      'prenom': _surnameController.text,
      'age': _ageController.text,
      'ville': _cityController.text,
      'motdepasse': _passwordController.text,
      'date': DateTime.now().toIso8601String(),
    };

    // Chemin absolu vers le dossier 'data' à la racine du projet
    final dir = Directory('data');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final file = File('data/user_data.json');
    await file.writeAsString(jsonEncode(userData));

    widget.onSignupComplete();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Âge'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Ville'),
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (v) => v!.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveSignup();
                  }
                },
                child: const Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}