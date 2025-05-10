import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Alterar Senha", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha Atual",
                labelStyle: TextStyle(
                  color: Color(0xFF402819),
                ), // Primary color
                filled: true,
                fillColor: Color(
                  0xFFdfccb2,
                ).withOpacity(0.2), // Light secondary color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Color(0xFF402819),
                  ), // Primary color
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Nova Senha",
                labelStyle: TextStyle(
                  color: Color(0xFF402819),
                ), // Primary color
                filled: true,
                fillColor: Color(
                  0xFFdfccb2,
                ).withOpacity(0.2), // Light secondary color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Color(0xFF402819),
                  ), // Primary color
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar Nova Senha",
                labelStyle: TextStyle(
                  color: Color(0xFF402819),
                ), // Primary color
                filled: true,
                fillColor: Color(
                  0xFFdfccb2,
                ).withOpacity(0.2), // Light secondary color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Color(0xFF402819),
                  ), // Primary color
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle password change
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF402819), // Primary color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Alterar Senha",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFdfccb2), // Secondary color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
