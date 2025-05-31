import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images
import 'dart:io'; // For handling file paths

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int completedGoals = 5; // Example data for completed goals
    int totalGoals = 10; // Example data for total goals

    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Perfil",
            style: TextStyle(
              color: Color(0xFF125c52), // Primary color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Section
              Row(
                children: [
                  // Profile Picture
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFFdbdad5), // Neutral color
                        backgroundImage:
                            _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                        child:
                            _profileImage == null
                                ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Color(0xFF125c52), // Primary color
                                )
                                : null,
                      ),
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFF24b5a1), // Secondary color
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white, // White icon for contrast
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  // Name and Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vinicius Aguiar",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "vinicius@example.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF676664), // Neutral color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Personal Data Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dados Pessoais",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      SizedBox(height: 16),
                      _personalDataRow("Idade", "28 anos"),
                      _personalDataRow("Altura", "1.75m"),
                      _personalDataRow("Peso", "70kg"),
                      _personalDataRow("IMC", "22.9 (Normal)"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Goals Summary Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resumo de Metas",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Concluídas:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF676664), // Neutral color
                            ),
                          ),
                          Text(
                            "$completedGoals de $totalGoals",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF24b5a1), // Secondary color
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: completedGoals / totalGoals,
                        backgroundColor: Color(0xFFdbdad5), // Neutral color
                        color: Color(0xFF24b5a1), // Secondary color
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Settings Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Configurações",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      SizedBox(height: 16),
                      _settingsOption(
                        context,
                        icon: Icons.lock_outline,
                        label: "Alterar Senha",
                        onTap: () {
                          Navigator.pushNamed(context, '/change-password');
                        },
                      ),
                      _settingsOption(
                        context,
                        icon: Icons.notifications_outlined,
                        label: "Notificações",
                        onTap: () {
                          Navigator.pushNamed(context, '/notifications');
                        },
                      ),
                      _settingsOption(
                        context,
                        icon: Icons.help_outline,
                        label: "Ajuda",
                        onTap: () {
                          Navigator.pushNamed(context, '/help');
                        },
                      ),
                      _settingsOption(
                        context,
                        icon: Icons.info_outline,
                        label: "Sobre o App",
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF125c52), // Primary color
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                    ), // Larger button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    "Sair da Conta",
                    style: TextStyle(
                      fontSize: 18, // Larger font size
                      color: Colors.white, // White text for contrast
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

  Widget _settingsOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFdbdad5).withOpacity(0.5), // Neutral color
        child: Icon(
          icon,
          color: Color(0xFF125c52), // Primary color
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF125c52), // Primary color
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _personalDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF676664), // Neutral color
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF125c52), // Primary color
            ),
          ),
        ],
      ),
    );
  }
}
