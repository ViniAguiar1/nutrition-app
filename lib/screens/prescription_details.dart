import 'package:flutter/material.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
  final String title;
  final String details;
  final String date;

  PrescriptionDetailsScreen({
    required this.title,
    required this.details,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
            // Prescription Header
            Text(
              "Prescrição Médica",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Data: $date",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),

            // Prescription Details
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
              details,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),

            // Example Prescription Items
            Text(
              "Itens da Prescrição:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.medical_services, color: Color(0xFF402819)),
              title: Text("Vitamina D - 5000 UI"),
              subtitle: Text("Tomar 1 cápsula ao dia após o café da manhã."),
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: Color(0xFF402819)),
              title: Text("Ômega 3 - 1000 mg"),
              subtitle: Text("Tomar 1 cápsula ao dia após o almoço."),
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: Color(0xFF402819)),
              title: Text("Multivitamínico"),
              subtitle: Text("Tomar 1 cápsula ao dia antes de dormir."),
            ),
          ],
        ),
      ),
    );
  }
}
