import 'package:flutter/material.dart';
import 'prescription_details.dart'; // Import the PrescriptionDetails screen

class PrescricoesScreen extends StatelessWidget {
  final List<Map<String, String>> prescricoes = [
    {
      "title": "Prescrição 1",
      "date": "10/06/2023",
      "details": "Prescrição para suplementação de vitaminas.",
    },
    {
      "title": "Prescrição 2",
      "date": "05/06/2023",
      "details": "Plano alimentar para ganho de massa muscular.",
    },
    {
      "title": "Prescrição 3",
      "date": "01/06/2023",
      "details": "Plano alimentar para redução de gordura corporal.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescrições"),
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
          itemCount: prescricoes.length,
          itemBuilder: (context, index) {
            final prescricao = prescricoes[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  prescricao["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF402819), // Primary color
                  ),
                ),
                subtitle: Text("Data: ${prescricao["date"]}"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF402819),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PrescriptionDetailsScreen(
                            title: prescricao["title"]!,
                            details: prescricao["details"]!,
                            date: prescricao["date"]!,
                          ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
