// lib/widgets/home/schedule_card.dart
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

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
                "Today's Schedule",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(Icons.calendar_today, color: Colors.blue.shade600, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "10:00 AM",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text("Script Review"),
          const SizedBox(height: 8),
          const Text(
            "2:00 PM",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text("Location Scout"),
        ],
      ),
    );
  }
}
