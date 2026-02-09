import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [
                  OnboardPage(
                    icon: Icons.mobile_friendly,
                    title: "Easy Flutter UI",
                    subtitle:
                        "Learn how to build clean and modern Flutter user interfaces.",
                  ),
                  OnboardPage(
                    icon: Icons.code,
                    title: "Build Faster",
                    subtitle:
                        "Create apps faster with reusable widgets and themes.",
                  ),
                ],
              ),
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.indigo,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (currentPage == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(currentPage == 1 ? "Get Started" : "Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const OnboardPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 120, color: Colors.indigo),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
