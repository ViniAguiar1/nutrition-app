import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _updatesEnabled = true;
  bool _promotionsEnabled = false;
  bool _remindersEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Notificações",
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
            Text(
              "Gerencie suas notificações",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Escolha quais notificações você deseja receber.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF676664), // Neutral color
              ),
            ),
            SizedBox(height: 24),

            // Notification Options
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationOption(
                    icon: Icons.update,
                    title: "Notificações de Atualizações",
                    description:
                        "Receba informações sobre atualizações do app.",
                    value: _updatesEnabled,
                    onChanged: (value) {
                      setState(() {
                        _updatesEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationOption(
                    icon: Icons.local_offer,
                    title: "Notificações de Promoções",
                    description: "Fique por dentro das promoções exclusivas.",
                    value: _promotionsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _promotionsEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationOption(
                    icon: Icons.notifications_active,
                    title: "Notificações de Lembretes",
                    description: "Receba lembretes sobre suas atividades.",
                    value: _remindersEnabled,
                    onChanged: (value) {
                      setState(() {
                        _remindersEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationOption({
    required IconData icon,
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Color(
                0xFFdbdad5,
              ).withOpacity(0.5), // Neutral color
              child: Icon(
                icon,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF676664), // Neutral color
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Color(0xFF24b5a1), // Secondary color
            ),
          ],
        ),
      ),
    );
  }
}
