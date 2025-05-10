import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Ajuda", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Precisa de Ajuda?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Entre em contato conosco para suporte ou dúvidas:",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Color(0xFF402819),
              ), // Primary color
              title: Text("suporte@coelhoapp.com"),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xFF402819),
              ), // Primary color
              title: Text("+55 11 99999-9999"),
            ),
          ],
        ),
      ),
    );
  }
}
