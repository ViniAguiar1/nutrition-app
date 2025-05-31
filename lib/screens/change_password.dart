import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Alterar Senha",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 80,
                      color: Color(0xFF24b5a1), // Secondary color
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Atualize sua senha",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF125c52), // Primary color
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Por segurança, escolha uma senha forte.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF676664), // Neutral color
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              // Input Fields
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha Atual",
                  labelStyle: TextStyle(
                    color: Color(0xFF125c52), // Primary color
                  ),
                  filled: true,
                  fillColor: Color(
                    0xFFdbdad5,
                  ).withOpacity(0.2), // Neutral color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Nova Senha",
                  labelStyle: TextStyle(
                    color: Color(0xFF125c52), // Primary color
                  ),
                  filled: true,
                  fillColor: Color(
                    0xFFdbdad5,
                  ).withOpacity(0.2), // Neutral color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmar Nova Senha",
                  labelStyle: TextStyle(
                    color: Color(0xFF125c52), // Primary color
                  ),
                  filled: true,
                  fillColor: Color(
                    0xFFdbdad5,
                  ).withOpacity(0.2), // Neutral color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 32),

              // Action Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle password change
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF125c52), // Primary color
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    "Alterar Senha",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Footer Section
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Color(0xFF125c52), // Primary color
                      fontSize: 16,
                    ),
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
