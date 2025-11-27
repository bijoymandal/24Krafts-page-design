// lib/screens/home_screen.dart
import 'package:crafts/screens/pages/jobs_page.dart';
import 'package:crafts/screens/pages/members_page.dart';
import 'package:crafts/screens/pages/schedule_page.dart';
import 'package:crafts/screens/pages/home_page.dart';
import 'package:crafts/widgets/common/profile_app_bar.dart';
// import 'package:crafts/widgets/home/movie_project_card.dart';
// import 'package:crafts/widgets/home/streaming_banner.dart';
import 'package:crafts/widgets/common/liquid_bottom_navbar.dart';
import 'package:crafts/screens/pages/messages_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 2});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static const List<Widget> _pages = [
    MembersPage(),
    SchedulePage(),
    HomePage(),
    JobsPage(),
    MessagesPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const ProfileAppBar(),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: LiquidBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
