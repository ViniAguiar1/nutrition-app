import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriaisScreen extends StatelessWidget {
  final List<Map<String, String>> materiais = [
    {
      "title": "Guia de Alimentação Saudável",
      "description": "Dicas para manter uma alimentação equilibrada.",
      "link": "https://example.com/guia-alimentacao",
    },
    {
      "title": "Tabela de Alimentos Permitidos",
      "description": "Lista de alimentos recomendados para sua dieta.",
      "link": "https://example.com/tabela-alimentos",
    },
    {
      "title": "Receitas Saudáveis",
      "description": "Receitas práticas e saudáveis para o dia a dia.",
      "link": "https://example.com/receitas-saudaveis",
    },
    {
      "title": "Importância da Hidratação",
      "description": "Entenda como a hidratação impacta sua saúde.",
      "link": "https://example.com/hidratacao",
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
      appBar: AppBar(
        title: Text("Materiais"),
        backgroundColor: Color(0xFF402819), // Primary color
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: materiais.length,
          itemBuilder: (context, index) {
            final material = materiais[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  material["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF402819), // Primary color
                  ),
                ),
                subtitle: Text(material["description"]!),
                trailing: IconButton(
                  icon: Icon(Icons.open_in_new, color: Color(0xFF402819)),
                  onPressed: () => _openMaterial(material["link"]!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
