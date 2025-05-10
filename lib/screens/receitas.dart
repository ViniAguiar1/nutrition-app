import 'package:flutter/material.dart';

class ReceitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas"),
        backgroundColor: Colors.brown.shade300,
      ),
      body: Center(child: Text("Conteúdo de Receitas")),
    );
  }
}
