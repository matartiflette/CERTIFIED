import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String description;
  final String domain;
  final String imageUrl;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.description,
    required this.domain,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.imageUrl),
                backgroundColor: theme.primaryColor.withOpacity(0.1),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 20),
              Chip(
                label: Text(
                  widget.domain,
                  style: TextStyle(
                    color: theme.primaryColorLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}