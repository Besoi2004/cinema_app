import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app1/consts.dart';
import 'package:test_app1/pages/cinema_main_screen.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardItem> _onboardItems = [
    OnboardItem(
      title: 'Explore Movies',
      description: 'Discover thousands of movies and find your favorites',
      image: 'assets/cinema/machine.png',
    ),
    OnboardItem(
      title: 'Book Tickets',
      description: 'Reserve your seats for upcoming movies in just a few taps',
      image: 'assets/cinema/ticket.png',
    ),
    OnboardItem(
      title: 'Enjoy Premier Experience',
      description: 'Get the best cinema experience with our premium features',
      image: 'assets/cinema/popcorn.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _onboardItems.length,
              itemBuilder: (context, index) {
                return _buildOnboardPage(_onboardItems[index]);
              },
            ),
          ),
          _buildPageIndicator(),
          _buildBottomButtons(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildOnboardPage(OnboardItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 280,
            width: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor.withOpacity(0.1),
            ),
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  item.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            item.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardItems.length,
        (index) => Container(
          width: _currentPage == index ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentPage == index ? buttonColor : Colors.white24,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _navigateToMainScreen();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_currentPage < _onboardItems.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                _navigateToMainScreen();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              _currentPage < _onboardItems.length - 1 ? 'Next' : 'Get Started',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToMainScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CinemaMainScreen(),
      ),
    );
  }
}

class OnboardItem {
  final String title;
  final String description;
  final String image;

  OnboardItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
