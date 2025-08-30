import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  final String name;
  final String description;
  final String domain;
  final String imageUrl;

  // Personnalisation
  final TextStyle? nameStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? domainStyle;
  final double avatarRadius;
  final EdgeInsetsGeometry contentPadding;
  final Widget? customChip;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.description,
    required this.domain,
    required this.imageUrl,
    this.nameStyle,
    this.descriptionStyle,
    this.domainStyle,
    this.avatarRadius = 60,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    this.customChip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: contentPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: theme.primaryColor.withOpacity(0.1),
              ),
              const SizedBox(height: 24),
              Text(
                name,
                style: nameStyle ??
                    theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: descriptionStyle ??
                    theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              customChip ??
                  Chip(
                    label: Text(
                      domain,
                      style: domainStyle ??
                          TextStyle(
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
