import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceitasScreen extends StatefulWidget {
  @override
  _ReceitasScreenState createState() => _ReceitasScreenState();
}

class _ReceitasScreenState extends State<ReceitasScreen> {
  final List<Map<String, String>> receitas = [
    {
      "title": "Panqueca de Aveia",
      "description": "Uma opção saudável para o café da manhã.",
      "link": "https://example.com/panqueca-aveia",
      "image":
          "https://plus.unsplash.com/premium_photo-1672846027109-e2c91500afef?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Salada de Quinoa",
      "description": "Rica em proteínas e fácil de preparar.",
      "link": "https://example.com/salada-quinoa",
      "image":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Frango Grelhado com Legumes",
      "description": "Uma refeição completa e nutritiva.",
      "link": "https://example.com/frango-legumes",
      "image":
          "https://plus.unsplash.com/premium_photo-1683139918895-06f8f3b9939e?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Smoothie de Frutas Vermelhas",
      "description": "Refrescante e cheio de antioxidantes.",
      "link": "https://example.com/smoothie-frutas",
      "image":
          "https://images.unsplash.com/photo-1615478503562-ec2d8aa0e24e?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  List<Map<String, String>> _filteredReceitas = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredReceitas = receitas; // Initialize with all recipes
  }

  void _filterReceitas(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredReceitas = receitas;
      } else {
        _filteredReceitas =
            receitas.where((receita) {
              final title = receita["title"]!.toLowerCase();
              final description = receita["description"]!.toLowerCase();
              return title.contains(query.toLowerCase()) ||
                  description.contains(query.toLowerCase());
            }).toList();
      }
    });
  }

  void _openRecipe(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
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
          "Receitas",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Buscar Receitas",
                labelStyle: TextStyle(
                  color: Color(0xFF125c52),
                ), // Primary color
                prefixIcon: Icon(Icons.search, color: Color(0xFF125c52)),
                filled: true,
                fillColor: Color(0xFFdbdad5).withOpacity(0.2), // Neutral color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
              ),
              onChanged: _filterReceitas,
            ),
            SizedBox(height: 16),

            // Recipe List
            Expanded(
              child:
                  _filteredReceitas.isEmpty
                      ? Center(
                        child: Text(
                          "Nenhuma receita encontrada.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF676664), // Neutral color
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: _filteredReceitas.length,
                        itemBuilder: (context, index) {
                          final receita = _filteredReceitas[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: InkWell(
                              onTap: () => _openRecipe(receita["link"]!),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        receita["image"]!,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            receita["title"]!,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(
                                                0xFF125c52,
                                              ), // Primary color
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            receita["description"]!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(
                                                0xFF676664,
                                              ), // Neutral color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.open_in_new,
                                      color: Color(0xFF125c52), // Primary color
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
