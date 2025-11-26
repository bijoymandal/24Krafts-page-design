// lib/widgets/home/streaming_banner.dart
import 'dart:async';
import 'package:flutter/material.dart';

class StreamingBanner extends StatefulWidget {
  const StreamingBanner({super.key});

  @override
  State<StreamingBanner> createState() => _StreamingBannerState();
}

class _StreamingBannerState extends State<StreamingBanner> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  // Banner items
  final List<Map<String, String>> _banners = const [
    {
      "image": "assets/images/movie_banner.png",
      "title": "OTT STREAMING SERVICES",
      "subtitle": "Netflix • Prime • Disney+ • Hulu",
    },
    {
      "image": "assets/images/movie_banner.png",
      "title": "CTV DEVICES",
      "subtitle": "Roku • Fire TV • Apple TV • Samsung",
    },
    {
      "image": "assets/images/movie_banner.png",
      "title": "WATCH ANYWHERE",
      "subtitle": "Stream on Smart TV, Phone, Tablet & More",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Auto slide
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;

      _currentPage = (_currentPage + 1) % _banners.length;

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        children: [
          // Banner slider
          PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final banner = _banners[index];
              return _buildBannerItem(
                imageUrl: banner["image"]!,
                title: banner["title"]!,
                subtitle: banner["subtitle"]!,
              );
            },
          ),

          // Dots
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _banners.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Single Banner Item
  Widget _buildBannerItem({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(imageUrl), // FIXED
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.3),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
