import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _obscurePassword = true;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "https://github.com/ViniAguiar1.png",
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24),
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF402819), // Primary color
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Color(0xFF402819), // Primary color
                  ),
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
                      color: Color(0xFF402819), // Primary color
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16),
              StatefulBuilder(
                builder: (context, setState) {
                  return TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Color(0xFF402819), // Primary color
                      ),
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
                          color: Color(0xFF402819), // Primary color
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF402819), // Primary color
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/client-panel',
                  ); // Navigate to ClientPanel
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF402819), // Primary color
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFdfccb2), // Secondary color
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navegar para recuperação de senha
                },
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(color: Color(0xFF402819)), // Primary color
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/saiba-mais',
                  ); // Navigate to Saiba Mais
                },
                child: Text(
                  "Não é paciente? Saiba Mais",
                  style: TextStyle(color: Color(0xFF402819)), // Primary color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
