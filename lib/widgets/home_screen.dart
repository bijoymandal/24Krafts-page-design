// lib/screens/home_screen.dart
import 'package:crafts/screens/pages/jobs_page.dart';
import 'package:crafts/screens/pages/members_page.dart';
import 'package:crafts/screens/pages/schedule_page.dart';
import 'package:crafts/screens/pages/home_page.dart';
import 'package:crafts/widgets/common/profile_app_bar.dart';
import 'package:crafts/widgets/common/liquid_bottom_navbar.dart';
import 'package:crafts/screens/pages/messages_page.dart';
import 'package:flutter/material.dart';

//
class HomeScreen extends StatefulWidget {
  final int initialIndex;
  final String number;
  // final String otp;

  const HomeScreen({
    super.key,
    this.initialIndex = 2,
    required this.number,
    // required this.otp,
  });

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

  // All pages (non-const widgets cannot be const, but that's fine)
  static final List<Widget> _pages = [
    const MembersPage(),
    const SchedulePage(),
    const HomePage(),
    const JobsPage(),
    const MessagesPage(),
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
      appBar: ProfileAppBar(number: widget.number),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: LiquidBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
