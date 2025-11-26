// lib/screens/pages/home_page.dart
import 'package:crafts/widgets/home/jobs_card.dart';
import 'package:crafts/widgets/home/streaming_banner.dart';
import 'package:crafts/widgets/home/movie_project_card.dart';
import 'package:crafts/widgets/home/schedule_card.dart';
import 'package:crafts/widgets/home/favorites_section.dart';
// import 'package:crafts/widgets/home/movie_projects_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Streaming Banner
          const StreamingBanner(),
          const SizedBox(height: 24),

          // 2. Schedule + Jobs Row
          const Row(
            children: [
              Expanded(child: ScheduleCard()),
              SizedBox(width: 16),
              Expanded(child: JobsCard()),
            ],
          ),
          const SizedBox(height: 24),

          // 3. Favorites Section
          const FavoritesSection(),
          const SizedBox(height: 32),

          // 4. Movie Projects Section (with View All + Cards)
          MovieProjectCard(
            title: "Spirit",
            subtitle: "Drama • 2024",
            status: "In Production",
            statusColor: Colors.green,
            bannerImageUrl:
                "assets/images/movie_banner1.png", // Prabhas Spirit banner
            trailingIcon: InkWell(
              onTap: () {
                print("Favorite tapped!");
              },
              child: const Icon(
                Icons.favorite_border,
                size: 26,
                color: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 16),

          MovieProjectCard(
            title: "Kooli",
            subtitle: "Adventure • 2024",
            status: "Pre-Production",
            statusColor: Colors.orange,
            bannerImageUrl: "assets/images/movie_banner2.png",
            trailingIcon: InkWell(
              onTap: () {
                print("Favorite tapped!");
              },
              child: const Icon(
                Icons.favorite_border,
                size: 26,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 16),
          MovieProjectCard(
            title: "Viswambara",
            subtitle: "Sci-Fi • 2025",
            status: "Development",
            statusColor: Colors.blue,
            bannerImageUrl: "assets/images/movie_banner3.png",
            trailingIcon: InkWell(
              onTap: () {
                print("Favorite tapped!");
              },
              child: const Icon(
                Icons.favorite_border,
                size: 26,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
