import 'package:flutter/material.dart';

class SaibaMaisScreen extends StatefulWidget {
  @override
  _SaibaMaisScreenState createState() => _SaibaMaisScreenState();
}

class _SaibaMaisScreenState extends State<SaibaMaisScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    "Sobre Matheus Coelho",
    "Clínica Davirakã",
    "Treinamento Personalizado",
    "Acompanhamento Nutricional",
    "Resultados Garantidos",
  ];

  final List<String> _descriptions = [
    "Matheus Coelho é um profissional renomado na área de saúde e bem-estar, com anos de experiência ajudando pessoas a alcançarem seus objetivos.",
    "A Clínica Davirakã é um espaço dedicado ao cuidado integral, oferecendo serviços de alta qualidade para saúde física e mental.",
    "Receba treinamentos personalizados que atendem às suas necessidades específicas, garantindo eficiência e segurança.",
    "Tenha um acompanhamento nutricional completo, com planos alimentares adaptados ao seu estilo de vida e objetivos.",
    "Com dedicação e suporte, você alcançará resultados reais e sustentáveis, transformando sua vida para melhor.",
  ];

  final List<String> _images = [
    "https://via.placeholder.com/300x200/FFB6C1/000000?text=Matheus+Coelho",
    "https://via.placeholder.com/300x200/FFD700/000000?text=Clínica+Davirakã",
    "https://via.placeholder.com/300x200/87CEFA/000000?text=Treinamento",
    "https://via.placeholder.com/300x200/FF6347/000000?text=Acompanhamento",
    "https://via.placeholder.com/300x200/90EE90/000000?text=Resultados",
  ];

  void _nextPage() {
    if (_currentPage < _titles.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context); // Navigate back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Saiba Mais",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / _titles.length,
            backgroundColor: Color(0xFFdbdad5), // Neutral color
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF125c52), // Primary color
            ),
          ),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          _images[index],
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        _titles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        _descriptions[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF676664), // Neutral color
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
                          ? Color(0xFF125c52) // Primary color
                          : Color(0xFF24b5a1), // Secondary color
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF125c52), // Primary color
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                _currentPage == _titles.length - 1
                    ? "Voltar ao Início"
                    : "Próximo",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // White text for contrast
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
