import 'package:flutter/material.dart';
import 'workout_exercises.dart'; // Import the new WorkoutExercises screen

class WorkoutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> workouts = [
      {
        "title": "Treino A",
        "description": "Peito, Tríceps e Ombros",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "title": "Treino B",
        "description": "Costas e Bíceps",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "title": "Treino C",
        "description": "Pernas e Glúteos",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
      {
        "title": "Treino D",
        "description": "Cardio e Core",
        "image":
            "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                "Treinos",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF125c52), // Primary color
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Escolha um treino para visualizar os exercícios.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF676664), // Neutral color
                ),
              ),
              SizedBox(height: 16),
              // Workout List
              Expanded(
                child: ListView.builder(
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => WorkoutExercisesScreen(
                                    workoutTitle: workouts[index]["title"]!,
                                  ),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Workout Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                workouts[index]["image"]!,
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            // Workout Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    workouts[index]["title"]!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF125c52), // Primary color
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    workouts[index]["description"]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF676664), // Neutral color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Arrow Icon
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xFF125c52), // Primary color
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
