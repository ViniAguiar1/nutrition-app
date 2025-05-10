import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

class ClientPanel extends StatefulWidget {
  @override
  _ClientPanelState createState() => _ClientPanelState();
}

class _ClientPanelState extends State<ClientPanel> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomeScreen(), ProfileScreen()];

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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
        selectedItemColor: Colors.brown.shade300,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
