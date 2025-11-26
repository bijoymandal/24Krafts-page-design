// lib/widgets/home/jobs_card.dart
import 'package:flutter/material.dart';

class JobsCard extends StatelessWidget {
  const JobsCard({super.key});

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
                "Jobs Applied",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(Icons.work, color: Colors.green.shade600, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "12",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text("Active Applications"),
          const SizedBox(height: 8),
          Text(
            "+3 this week",
            style: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
