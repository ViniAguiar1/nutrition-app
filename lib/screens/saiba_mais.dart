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
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: Text("Saiba Mais"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / _titles.length,
            backgroundColor: Color(0xFFdfccb2), // Secondary color
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF402819),
            ), // Primary color
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
                        style: TextStyle(fontSize: 16, color: Colors.black87),
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
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                _currentPage == _titles.length - 1
                    ? "Voltar ao Início"
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
    );
  }
}
