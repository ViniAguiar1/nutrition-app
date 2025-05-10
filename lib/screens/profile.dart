import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Perfil", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // User Info Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFdfccb2), // Secondary color
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xFF402819), // Primary color
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vinicius Aguiar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF402819), // Primary color
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "vinicius@example.com",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Settings Section
              Text(
                "Configurações",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF402819), // Primary color
                ),
              ),
              SizedBox(height: 10),
              _settingsOption(
                context,
                icon: Icons.lock_outline,
                label: "Alterar Senha",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/change-password',
                  ); // Navigate to Change Password
                },
              ),
              _settingsOption(
                context,
                icon: Icons.notifications_outlined,
                label: "Notificações",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/notifications',
                  ); // Navigate to Notifications
                },
              ),
              _settingsOption(
                context,
                icon: Icons.help_outline,
                label: "Ajuda",
                onTap: () {
                  Navigator.pushNamed(context, '/help'); // Navigate to Help
                },
              ),
              _settingsOption(
                context,
                icon: Icons.info_outline,
                label: "Sobre o App",
                onTap: () {
                  Navigator.pushNamed(context, '/about'); // Navigate to About
                },
              ),
              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                  ); // Navigate to Login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF402819), // Primary color
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Sair da Conta",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFdfccb2), // Secondary color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Color(
          0xFFdfccb2,
        ).withOpacity(0.2), // Light secondary color
        child: Icon(
          icon,
          color: Color(0xFF402819), // Primary color
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF402819), // Primary color
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
