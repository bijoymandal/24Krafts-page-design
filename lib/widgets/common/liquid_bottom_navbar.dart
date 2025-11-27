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
    {"icon": Icons.people_rounded, "label": "Members"},
    {"icon": Icons.calendar_today_rounded, "label": "Schedule"},
    {"icon": Icons.home_rounded, "label": "Home"},
    {"icon": Icons.work_rounded, "label": "Jobs"},
    {"icon": Icons.message_rounded, "label": "Messages"},
  ];

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9333EA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 36 + bottomInset, // Final safe height
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: _items.asMap().entries.map((entry) {
                final index = entry.key;
                final active = currentIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => onTap(index),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          entry.value["icon"],
                          size: active ? 28 : 24,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 1),

                        // Label auto fits - no overflow
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              entry.value["label"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: active ? 12 : 11,
                                fontWeight: active
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),

                        const SizedBox(height: 1),

                        // Active dot (doesn't take layout height when inactive)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: active ? 6 : 0,
                          width: active ? 6 : 0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: active
                                ? const [
                                    BoxShadow(
                                      color: Colors.white54,
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
