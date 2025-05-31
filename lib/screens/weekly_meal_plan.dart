import 'package:flutter/material.dart';

class WeeklyMealPlanScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> weeklyMeals = {
    "Segunda-feira": [
      {
        "horario": "08:00",
        "refeicao": "Café da manhã: Pão integral e suco",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "horario": "12:00",
        "refeicao": "Almoço: Frango grelhado e arroz integral",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "horario": "19:00",
        "refeicao": "Jantar: Sopa de legumes",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
    ],
    "Terça-feira": [
      {
        "horario": "08:00",
        "refeicao": "Café da manhã: Iogurte e granola",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "horario": "12:00",
        "refeicao": "Almoço: Peixe grelhado e batata doce",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "horario": "19:00",
        "refeicao": "Jantar: Salada com atum",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
    ],
    // Add more days and meals as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Plano Alimentar Semanal",
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
        child: ListView.builder(
          itemCount: weeklyMeals.keys.length,
          itemBuilder: (context, index) {
            String day = weeklyMeals.keys.elementAt(index);
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ExpansionTile(
                title: Text(
                  day,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                children:
                    weeklyMeals[day]!
                        .map(
                          (meal) => ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                meal["image"]!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              meal["horario"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF125c52), // Primary color
                              ),
                            ),
                            subtitle: Text(
                              meal["refeicao"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF676664), // Neutral color
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
