import 'package:flutter/material.dart';

class MateriaisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materiais"),
        backgroundColor: Colors.brown.shade300,
      ),
      body: Center(child: Text("Conteúdo de Materiais")),
    );
  }
}
