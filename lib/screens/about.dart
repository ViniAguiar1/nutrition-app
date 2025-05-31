import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Sobre o App",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 80,
                    color: Color(0xFF24b5a1), // Secondary color
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Coelho App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sua saúde, nosso compromisso.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF676664), // Neutral color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // About Section
            Text(
              "Sobre o Coelho App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "O Coelho App foi desenvolvido para ajudar você a organizar sua alimentação, treinos e acompanhamento nutricional. Nosso objetivo é oferecer uma experiência personalizada e eficiente para alcançar seus objetivos de saúde e bem-estar.",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF676664), // Neutral color
              ),
            ),
            SizedBox(height: 24),

            // Version Section
            Text(
              "Versão",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "1.0.0",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF676664), // Neutral color
              ),
            ),
            SizedBox(height: 24),

            // Footer Section
            Center(
              child: Text(
                "Desenvolvido com ❤️ por Equipe Nutrix",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF676664), // Neutral color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
