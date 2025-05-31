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
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Prescrições",
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
          itemCount: prescricoes.length,
          itemBuilder: (context, index) {
            final prescricao = prescricoes[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(
                          0xFFdbdad5,
                        ).withOpacity(0.5), // Neutral color
                        child: Icon(
                          Icons.description,
                          color: Color(0xFF125c52), // Primary color
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prescricao["title"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF125c52), // Primary color
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Data: ${prescricao["date"]}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF676664), // Neutral color
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
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
