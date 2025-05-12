import 'package:flutter/material.dart';
import 'workout_exercises.dart'; // Import the new WorkoutExercises screen

class WorkoutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> workouts = [
      {"title": "Treino A", "description": "Peito, Tríceps e Ombros"},
      {"title": "Treino B", "description": "Costas e Bíceps"},
      {"title": "Treino C", "description": "Pernas e Glúteos"},
      {"title": "Treino D", "description": "Cardio e Core"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Treinos", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFdfccb2), // Secondary color
                  child: Icon(
                    Icons.fitness_center,
                    color: Color(0xFF402819), // Primary color
                  ),
                ),
                title: Text(
                  workouts[index]["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF402819), // Primary color
                  ),
                ),
                subtitle: Text(
                  workouts[index]["description"]!,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF402819), // Primary color
                  ),
                  child: Text(
                    "Ver Exercícios",
                    style: TextStyle(
                      color: Color(0xFFdfccb2),
                    ), // Secondary color
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
