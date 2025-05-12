import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    "Bem-vindo!",
    "Planos Personalizados",
    "Vamos Começar?",
  ];

  final List<String> _descriptions = [
    "Organize sua alimentação e treinos com facilidade.",
    "Receba planos feitos sob medida pelo Matheus Coelho.",
    "Acompanhe seus resultados e alcance seus objetivos.",
  ];

  final List<String> _images = [
    "assets/images/welcome.png", // Placeholder for onboarding images
    "assets/images/plans.png",
    "assets/images/start.png",
  ];

  void _nextPage() {
    if (_currentPage < _titles.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _titles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://github.com/ViniAguiar1.png",
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 24),
                          Text(
                            _titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF402819), // Primary color
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            _descriptions[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _titles.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(4.0),
                    width: _currentPage == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == index
                              ? Color(0xFF402819) // Primary color
                              : Color(0xFFdfccb2), // Secondary color
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF402819), // Primary color
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    _currentPage == _titles.length - 1
                        ? "Ir para Login"
                        : "Próximo",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFdfccb2), // Secondary color
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                ); // Skip to login
              },
              child: Text(
                "Pular",
                style: TextStyle(
                  color: Color(0xFF402819), // Primary color
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
