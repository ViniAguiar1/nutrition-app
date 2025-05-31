import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'workouts.dart'; // Import the new Workouts screen
import 'goals.dart'; // Import the Goals screen

class ClientPanel extends StatefulWidget {
  @override
  _ClientPanelState createState() => _ClientPanelState();
}

class _ClientPanelState extends State<ClientPanel> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    WorkoutsScreen(), // Add Workouts screen
    GoalsScreen(), // Add Goals screen
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        backgroundColor: Colors.white, // Clean white background
        selectedItemColor: Color(0xFF125c52), // Updated primary color
        unselectedItemColor: Color(0xFF676664), // Updated neutral color
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ), // Highlight selected label
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Treinos",
          ), // New tab
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "Metas",
          ), // New tab
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
