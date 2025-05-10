import 'package:flutter/material.dart';

class PrescricoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescrições"),
        backgroundColor: Colors.brown.shade300,
      ),
      body: Center(child: Text("Conteúdo de Prescrições")),
    );
  }
}
