import 'package:flutter/material.dart';
import 'schedule_consultation.dart'; // Import the ScheduleConsultationScreen

class ConsultationHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> consultations = [
    {
      "date": "10/06/2023",
      "status": "Concluída",
      "details": "Consulta de acompanhamento nutricional.",
    },
    {
      "date": "05/05/2023",
      "status": "Concluída",
      "details": "Consulta inicial para avaliação.",
    },
    {
      "date": "20/04/2023",
      "status": "Cancelada",
      "details": "Consulta desmarcada pelo paciente.",
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
          "Histórico de Consultas",
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
          itemCount: consultations.length,
          itemBuilder: (context, index) {
            final consultation = consultations[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      consultation["status"] == "Concluída"
                          ? Color(0xFF24b5a1) // Secondary color for completed
                          : Color(0xFFdbdad5), // Neutral color for canceled
                  child: Icon(
                    consultation["status"] == "Concluída"
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  consultation["date"]!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                subtitle: Text(
                  consultation["details"]!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF676664), // Neutral color
                  ),
                ),
                trailing: Text(
                  consultation["status"]!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:
                        consultation["status"] == "Concluída"
                            ? Color(0xFF24b5a1) // Secondary color
                            : Colors.red, // Red for canceled
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScheduleConsultationScreen(),
            ),
          );
        },
        backgroundColor: Color(0xFF125c52), // Primary color
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
