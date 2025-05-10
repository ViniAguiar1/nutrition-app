import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Sobre o App", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Coelho App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF402819), // Primary color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "O Coelho App foi desenvolvido para ajudar você a organizar sua alimentação, treinos e acompanhamento nutricional. Nosso objetivo é oferecer uma experiência personalizada e eficiente para alcançar seus objetivos de saúde e bem-estar.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
            Text(
              "Versão: 1.0.0",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
