import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da Consulta"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Consulta com Matheus Coelho",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Color(0xFF402819)),
                SizedBox(width: 8),
                Text(
                  "10/06/2025",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, color: Color(0xFF402819)),
                SizedBox(width: 8),
                Text(
                  "14:00",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ],
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),
            Text(
              "Detalhes:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Consulta online via Zoom para revisão do plano alimentar. Certifique-se de estar em um local tranquilo e com boa conexão à internet.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle joining the consultation
                },
                icon: Icon(Icons.video_call, size: 24),
                label: Text(
                  "Entrar na Consulta",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF402819), // Primary color
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
