import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onChanged;

  const GenderSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final genders = ["Male", "Female", "Other"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        Row(
          children: genders.map((g) {
            return Expanded(
              child: Row(
                children: [
                  Radio<String>(
                    value: g,
                    groupValue: selected,
                    onChanged: onChanged,
                  ),
                  Text(g),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
