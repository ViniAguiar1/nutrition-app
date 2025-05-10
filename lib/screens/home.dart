import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _carouselController = PageController();
  int _currentCarouselPage = 0;
  bool _showFullDiet = false;

  final List<Map<String, String>> _carouselItems = [
    {
      "title": "Bem-vindo!",
      "description": "Estamos felizes em tê-lo aqui, Vinicius!",
    },
    {
      "title": "Atualizações",
      "description": "Confira as novidades e atualizações do app.",
    },
    {
      "title": "Metas",
      "description": "Acompanhe suas metas e continue evoluindo!",
    },
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make status bar transparent
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF402819),
              ), // Primary color
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xFF402819)),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Add more menu items here
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Carousel Section
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _carouselController,
                onPageChanged: (index) {
                  setState(() {
                    _currentCarouselPage = index;
                  });
                },
                itemCount: _carouselItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: Color(0xFF402819), // Primary color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _carouselItems[index]["title"]!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFdfccb2), // Secondary color
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _carouselItems[index]["description"]!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFdfccb2), // Secondary color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _carouselItems.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4.0),
                  width: _currentCarouselPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentCarouselPage == index
                            ? Color(0xFF402819) // Primary color
                            : Color(0xFFdfccb2), // Secondary color
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Quick Access Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Acesso rápido",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF402819), // Primary color
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _quickAccessIcon("Materiais", Icons.book_outlined, () {
                    Navigator.pushNamed(context, '/materiais');
                  }),
                  _quickAccessIcon(
                    "Receitas",
                    Icons.calendar_today_outlined,
                    () {
                      Navigator.pushNamed(context, '/receitas');
                    },
                  ),
                  _quickAccessIcon("Chat", Icons.chat_outlined, () {
                    Navigator.pushNamed(context, '/chat');
                  }),
                  _quickAccessIcon(
                    "Prescrições",
                    Icons.medical_services_outlined,
                    () {
                      Navigator.pushNamed(context, '/prescricoes');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Meal Plan Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Plano alimentar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF402819), // Primary color
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/weekly-meal-plan');
                        },
                        child: Text(
                          _showFullDiet ? "Ver menos" : "Ver mais",
                          style: TextStyle(
                            color: Color(0xFF402819),
                          ), // Primary color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      height: 150,
                      child: PageView(
                        children: [
                          _dietCard(
                            "REF. 1",
                            "100g Frango grelhado...\n150g Arroz integral...\n10ml Azeite de oliva",
                          ),
                          _dietCard(
                            "REF. 2",
                            "130g Carne bovina sem gordura...\n200g Arroz ou macarrão...\n10ml Azeite de oliva",
                          ),
                          _dietCard(
                            "REF. 3",
                            "150g Peixe grelhado...\n200g Batata doce...\n10ml Azeite de oliva",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Horário Pré-agendado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Horário pré-agendado",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.brown.shade300,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "14:00  |  10/06/2025",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade400,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  textStyle: TextStyle(fontSize: 12),
                                ),
                                child: Text("Aceitar"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  textStyle: TextStyle(fontSize: 12),
                                ),
                                child: Text("Desmarcar"),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  textStyle: TextStyle(fontSize: 12),
                                ),
                                child: Text("Ver mais"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAccessIcon(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Color(
              0xFFdfccb2,
            ).withOpacity(0.2), // Light secondary color
            child: Icon(
              icon,
              color: Color(0xFF402819),
              size: 28,
            ), // Primary color
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF402819),
              fontSize: 12,
            ), // Primary color
          ),
        ],
      ),
    );
  }

  Widget _dietCard(String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF402819), // Primary color
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF402819), // Primary color
          ),
          child: Text(
            "Registrar",
            style: TextStyle(color: Color(0xFFdfccb2)), // Secondary color
          ),
        ),
      ),
    );
  }
}
