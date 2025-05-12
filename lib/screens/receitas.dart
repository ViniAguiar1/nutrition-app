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
    },
    {
      "title": "Salada de Quinoa",
      "description": "Rica em proteínas e fácil de preparar.",
      "link": "https://example.com/salada-quinoa",
    },
    {
      "title": "Frango Grelhado com Legumes",
      "description": "Uma refeição completa e nutritiva.",
      "link": "https://example.com/frango-legumes",
    },
    {
      "title": "Smoothie de Frutas Vermelhas",
      "description": "Refrescante e cheio de antioxidantes.",
      "link": "https://example.com/smoothie-frutas",
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
      appBar: AppBar(
        title: Text("Receitas"),
        backgroundColor: Color(0xFF402819), // Primary color
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
                prefixIcon: Icon(Icons.search, color: Color(0xFF402819)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: _filterReceitas,
            ),
            SizedBox(height: 16),

            // Recipe List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredReceitas.length,
                itemBuilder: (context, index) {
                  final receita = _filteredReceitas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        receita["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF402819), // Primary color
                        ),
                      ),
                      subtitle: Text(receita["description"]!),
                      trailing: IconButton(
                        icon: Icon(Icons.open_in_new, color: Color(0xFF402819)),
                        onPressed: () => _openRecipe(receita["link"]!),
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
