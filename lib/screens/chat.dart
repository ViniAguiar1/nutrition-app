import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Chat",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 80,
                color: Color(0xFF24b5a1), // Secondary color
              ),
              SizedBox(height: 16),
              Text(
                "Funcionalidade em Desenvolvimento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF125c52), // Primary color
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Estamos trabalhando para trazer o chat interno para você. Em breve, você poderá se comunicar diretamente com seu nutricionista.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF676664), // Neutral color
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF125c52), // Primary color
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
