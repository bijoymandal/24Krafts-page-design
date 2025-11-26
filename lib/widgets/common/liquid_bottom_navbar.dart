// lib/widgets/common/liquid_bottom_navbar.dart
import 'package:flutter/material.dart';

class LiquidBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const LiquidBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<Map<String, dynamic>> _items = [
    {"icon": Icons.home_rounded, "label": "Home"},
    {"icon": Icons.people_rounded, "label": "Members"},
    {"icon": Icons.calendar_today_rounded, "label": "Schedule"},
    {"icon": Icons.work_rounded, "label": "Jobs"},
  ];

  @override
  Widget build(BuildContext context) {
    // Auto-adjust height for small devices
    final double height = MediaQuery.of(context).size.height < 700
        ? 68.0
        : 76.0;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xFF9C27B0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: _items.asMap().entries.map((entry) {
            final int index = entry.key;
            final bool isActive = currentIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Icon(
                        _items[index]["icon"],
                        size: isActive ? 26 : 23,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 2), // Super minimal spacing
                      // Label
                      Text(
                        _items[index]["label"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isActive ? 11 : 9.5,
                          fontWeight: isActive
                              ? FontWeight.bold
                              : FontWeight.w500,
                          height: 1.0, // Removes hidden line padding
                        ),
                      ),

                      // Active Dot — Only when active
                      if (isActive)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 4.5,
                          height: 4.5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
