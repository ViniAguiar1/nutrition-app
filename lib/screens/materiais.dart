import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriaisScreen extends StatelessWidget {
  final List<Map<String, String>> materiais = [
    {
      "title": "Guia de Alimentação Saudável",
      "description": "Dicas para manter uma alimentação equilibrada.",
      "link": "https://example.com/guia-alimentacao",
      "image":
          "https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Tabela de Alimentos Permitidos",
      "description": "Lista de alimentos recomendados para sua dieta.",
      "link": "https://example.com/tabela-alimentos",
      "image":
          "https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Receitas Saudáveis",
      "description": "Receitas práticas e saudáveis para o dia a dia.",
      "link": "https://example.com/receitas-saudaveis",
      "image":
          "https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Importância da Hidratação",
      "description": "Entenda como a hidratação impacta sua saúde.",
      "link": "https://example.com/hidratacao",
      "image":
          "https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  void _openMaterial(String url) async {
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
          "Materiais",
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
        child: ListView.builder(
          itemCount: materiais.length,
          itemBuilder: (context, index) {
            final material = materiais[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () => _openMaterial(material["link"]!),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          material["image"]!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              material["title"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF125c52), // Primary color
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              material["description"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF676664), // Neutral color
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
    );
  }
}
