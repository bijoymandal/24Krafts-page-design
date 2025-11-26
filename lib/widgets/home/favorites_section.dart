// lib/widgets/home/favorites_section.dart
import 'package:flutter/material.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  Widget _item(String label, String count, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon, size: 36, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(
          count,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Favorites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(Icons.favorite, color: Colors.red.shade400),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _item("Projects", "8", Icons.folder_open, Colors.blue.shade100),
              _item("Teams", "5", Icons.people, Colors.purple.shade100),
              _item("Saved", "15", Icons.bookmark, Colors.orange.shade100),
              _item("Favourate", "10", Icons.favorite, Colors.red.shade100),
            ],
          ),
        ],
      ),
    );
  }
}
