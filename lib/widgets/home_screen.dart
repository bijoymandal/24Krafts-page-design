// lib/screens/home_screen.dart
import 'package:crafts/screens/pages/jobs_page.dart';
import 'package:crafts/screens/pages/members_page.dart';
import 'package:crafts/screens/pages/schedule_page.dart';
import 'package:crafts/screens/pages/home_page.dart';
import 'package:crafts/widgets/common/profile_app_bar.dart';
import 'package:crafts/widgets/home/movie_project_card.dart';
import 'package:crafts/widgets/home/streaming_banner.dart';
import 'package:crafts/widgets/common/liquid_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    MembersPage(),
    SchedulePage(),
    JobsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const ProfileAppBar(),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: LiquidBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
