import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  final List<Map<String, String>> updates = [
    {
      "title": "Nova Funcionalidade: Chat Interno",
      "date": "10/06/2023",
      "description":
          "Agora você pode se comunicar diretamente com seu nutricionista pelo app.",
    },
    {
      "title": "Atualização no Plano Alimentar",
      "date": "05/06/2023",
      "description":
          "Adicionamos novas receitas e opções de refeições ao seu plano alimentar.",
    },
    {
      "title": "Melhorias no Desempenho",
      "date": "01/06/2023",
      "description":
          "O app está mais rápido e estável com a última atualização.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Atualizações",
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
          itemCount: updates.length,
          itemBuilder: (context, index) {
            final update = updates[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  update["title"]!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      "Data: ${update["date"]}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF676664), // Neutral color
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      update["description"]!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF676664), // Neutral color
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
