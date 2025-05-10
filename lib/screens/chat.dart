import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.brown.shade300,
      ),
      body: Center(child: Text("Conteúdo do Chat")),
    );
  }
}
