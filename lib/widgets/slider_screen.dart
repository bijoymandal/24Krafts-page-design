import 'package:crafts/widgets/complete_profile_screen.dart';
import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> slides = [
    {
      "image": "assets/images/slider_1.png",
      "title": "Collaboration",
      "subtitle": "Connect to potential jobs in our verified Platform",
    },
    {
      "image": "assets/images/slider_2.png",
      "title": "Casting",
      "subtitle": "Connect to potential jobs in our verified Platform",
    },
    {
      "image": "assets/images/slider_3.png",
      "title": "Directors Spot-Light",
      "subtitle": "Connect to potential jobs in our verified Platform",
    },
  ];

  void nextPage() {
    if (_currentPage < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // last page → navigate or close onboarding
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (_, index) {
                final s = slides[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            s["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        s["title"]!,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        s["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Subtitle + Skip (NO GAP)
                      Column(
                        children: [
                          Text(
                            "Learn more by our document",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),

                          /// Skip (immediately under subtitle)
                          Row(
                            children: [
                              const Expanded(child: SizedBox()),

                              SizedBox(
                                width: 100,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const CompleteProfileScreen(),
                                    ),
                                  ),

                                  child: const Text(
                                    "Skip",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: _NextButton(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),

          /// Smooth Indicator
          // SmoothPageIndicator(
          //   controller: _controller,
          //   count: slides.length,
          //   effect: WormEffect(
          //     dotHeight: 10,
          //     dotWidth: 22,
          //     radius: 12,
          //     spacing: 8,
          //     dotColor: Colors.grey.shade300,
          //     activeDotColor: Colors.deepPurple,
          //   ),
          // ),
          // const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final parent = context.findAncestorStateOfType<_SliderScreenState>();
        parent?.nextPage();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: const Icon(Icons.arrow_forward, color: Colors.black87, size: 22),
      ),
    );
  }
}
