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
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Notificações", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text(
              "Notificações de Atualizações",
              style: TextStyle(color: Color(0xFF402819)), // Primary color
            ),
            value: _updatesEnabled,
            onChanged: (value) {
              setState(() {
                _updatesEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              "Notificações de Promoções",
              style: TextStyle(color: Color(0xFF402819)), // Primary color
            ),
            value: _promotionsEnabled,
            onChanged: (value) {
              setState(() {
                _promotionsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              "Notificações de Lembretes",
              style: TextStyle(color: Color(0xFF402819)), // Primary color
            ),
            value: _remindersEnabled,
            onChanged: (value) {
              setState(() {
                _remindersEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
