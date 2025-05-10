import 'package:flutter/material.dart';

class WeeklyMealPlanScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> weeklyMeals = {
    "Segunda-feira": [
      {"horario": "08:00", "refeicao": "Café da manhã: Pão integral e suco"},
      {
        "horario": "12:00",
        "refeicao": "Almoço: Frango grelhado e arroz integral",
      },
      {"horario": "19:00", "refeicao": "Jantar: Sopa de legumes"},
    ],
    "Terça-feira": [
      {"horario": "08:00", "refeicao": "Café da manhã: Iogurte e granola"},
      {"horario": "12:00", "refeicao": "Almoço: Peixe grelhado e batata doce"},
      {"horario": "19:00", "refeicao": "Jantar: Salada com atum"},
    ],
    // Add more days and meals as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plano Alimentar Semanal"),
        backgroundColor: Colors.brown.shade300,
      ),
      body: ListView.builder(
        itemCount: weeklyMeals.keys.length,
        itemBuilder: (context, index) {
          String day = weeklyMeals.keys.elementAt(index);
          return ExpansionTile(
            title: Text(
              day,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade700,
              ),
            ),
            children:
                weeklyMeals[day]!
                    .map(
                      (meal) => ListTile(
                        leading: Icon(
                          Icons.access_time,
                          color: Colors.brown.shade300,
                        ),
                        title: Text(meal["horario"]!),
                        subtitle: Text(meal["refeicao"]!),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    );
  }
}
