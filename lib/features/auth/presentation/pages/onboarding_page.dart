import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mizara/core/theme/app_theme.dart';
import 'package:mizara/features/auth/presentation/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Nous servons des délices incomparables de riz.',
      'description':
          'Tous les meilleurs collecteurs de riz avec leurs produits de qualité vous selectons le sont à votre disposition pour un repas sain.',
    },
    // Ajoutez plus de pages d'accueil ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Image.asset(
            'assets/images/home.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Superposition
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.primaryColor.withOpacity(0.7),
                  AppTheme.primaryColor.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Contenu
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _pages[index]['title']!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _pages[index]['description']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8,
                          dotColor: Colors.white38,
                          activeDotColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => Get.off(() => const LoginPage()),
                            child: const Text(
                              'Passer',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_currentPage == _pages.length - 1) {
                                Get.off(() => const LoginPage());
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Suivant',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
