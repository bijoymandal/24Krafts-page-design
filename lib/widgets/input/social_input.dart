import 'package:flutter/material.dart';

class SocialInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;

  const SocialInput({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
