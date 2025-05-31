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
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: SingleChildScrollView(
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
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Data: $date",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF676664), // Neutral color
              ),
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),

            // Prescription Details
            Text(
              "Detalhes:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              details,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF676664), // Neutral color
              ),
            ),
            Divider(height: 32, thickness: 1, color: Colors.grey.shade300),

            // Prescription Items Section
            Text(
              "Itens da Prescrição:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            _buildPrescriptionItem(
              icon: Icons.medical_services,
              title: "Vitamina D - 5000 UI",
              subtitle: "Tomar 1 cápsula ao dia após o café da manhã.",
            ),
            _buildPrescriptionItem(
              icon: Icons.medical_services,
              title: "Ômega 3 - 1000 mg",
              subtitle: "Tomar 1 cápsula ao dia após o almoço.",
            ),
            _buildPrescriptionItem(
              icon: Icons.medical_services,
              title: "Multivitamínico",
              subtitle: "Tomar 1 cápsula ao dia antes de dormir.",
            ),
            SizedBox(height: 24),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF125c52), // Primary color
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Voltar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // White text for contrast
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFdbdad5).withOpacity(0.5), // Neutral color
          child: Icon(
            icon,
            color: Color(0xFF125c52), // Primary color
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF125c52), // Primary color
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF676664), // Neutral color
          ),
        ),
      ),
    );
  }
}
