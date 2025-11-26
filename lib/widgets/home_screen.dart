// lib/screens/home_screen.dart
import 'package:crafts/widgets/home/movie_project_card.dart';
import 'package:crafts/widgets/home/streaming_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: const AssetImage(
                'assets/images/user_avatar.jpg',
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sarah Johnson",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Film Producer",
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Streaming Services Banner
            const StreamingBanner(),

            const SizedBox(height: 24),

            // Today's Schedule + Jobs Applied
            Row(
              children: [
                Expanded(child: _buildScheduleCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildJobsCard()),
              ],
            ),

            const SizedBox(height: 24),

            // Favorites Section
            _buildFavoritesSection(),

            const SizedBox(height: 32),

            // Movie Projects Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Movie Projects",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Color(0xFF9C27B0)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Movie Cards
            // Inside your Column in HomeScreen
            MovieProjectCard(
              title: "Spirit",
              subtitle: "Drama • 2024",
              status: "In Production",
              statusColor: Colors.green,
              bannerImageUrl:
                  "https://i.imgur.com/8xY5i8K.png", // Prabhas Spirit banner
            ),

            const SizedBox(height: 16),

            MovieProjectCard(
              title: "Kooli",
              subtitle: "Adventure • 2024",
              status: "Pre-Production",
              statusColor: Colors.orange,
              bannerImageUrl: "https://i.imgur.com/3dL7v9m.png",
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF9C27B0),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Members"),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Schedule",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
        ],
      ),
    );
  }

  // Schedule Card
  Widget _buildScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
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

  // Jobs Applied Card
  Widget _buildJobsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
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

  // Favorites Section
  Widget _buildFavoritesSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
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
              _favoriteItem(
                "Projects",
                "8",
                Icons.folder_open,
                Colors.blue.shade100,
              ),
              _favoriteItem("Teams", "5", Icons.people, Colors.purple.shade100),
              _favoriteItem(
                "Saved",
                "15",
                Icons.bookmark,
                Colors.orange.shade100,
              ),
              _favoriteItem(
                "Favourate",
                "10",
                Icons.favorite,
                Colors.red.shade100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _favoriteItem(
    String label,
    String count,
    IconData icon,
    Color bgColor,
  ) {
    return Column(
      children: [
        // SQUARE WITH 5px BORDER RADIUS
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5), // ← 5px rounded corners
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
}
