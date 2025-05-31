import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'exercise_history.dart'; // Import the new ExerciseHistory screen

class WorkoutExercisesScreen extends StatefulWidget {
  final String workoutTitle;

  WorkoutExercisesScreen({required this.workoutTitle});

  @override
  _WorkoutExercisesScreenState createState() => _WorkoutExercisesScreenState();
}

class _WorkoutExercisesScreenState extends State<WorkoutExercisesScreen> {
  final List<Map<String, String>> exercises = [
    {
      "name": "Supino Reto",
      "image": "https://github.com/ViniAguiar1.png",
      "video": "https://www.youtube.com/watch?v=example1",
    },
    {
      "name": "Tríceps Testa",
      "image": "https://github.com/ViniAguiar1.png",
      "video": "https://www.youtube.com/watch?v=example2",
    },
    {
      "name": "Desenvolvimento com Halteres",
      "image": "https://github.com/ViniAguiar1.png",
      "video": "https://www.youtube.com/watch?v=example3",
    },
  ];

  final Map<String, List<Map<String, dynamic>>> _progressionData = {};

  void _saveProgress(String exerciseName, List<Map<String, dynamic>> series) {
    setState(() {
      if (!_progressionData.containsKey(exerciseName)) {
        _progressionData[exerciseName] = [];
      }
      _progressionData[exerciseName]!.addAll(series);
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Progresso salvo com sucesso!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _navigateToHistory(String exerciseName) {
    final history = _progressionData[exerciseName] ?? [];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ExerciseHistoryScreen(
              exerciseName: exerciseName,
              history: history,
            ),
      ),
    );
  }

  void _openVideo(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.workoutTitle,
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
          itemCount:
              exercises.length +
              (exercises.length ~/ 2), // Add space for banners
          itemBuilder: (context, index) {
            if (index % 3 == 2) {
              // Insert a promotional banner after every 2 exercises
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    "https://jpimg.com.br/uploads/2017/04/2526327569-logotipo-mancha-verde-1024x819.jpg",
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              final exerciseIndex = index - (index ~/ 3);
              final exercise = exercises[exerciseIndex];
              final List<Map<String, dynamic>> series = [
                {"series": 1, "weight": 0, "reps": 0},
                {"series": 2, "weight": 0, "reps": 0},
                {"series": 3, "weight": 0, "reps": 0},
              ];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              exercise["image"]!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              exercise["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF125c52), // Primary color
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.play_circle_fill,
                              color: Color(0xFF24b5a1), // Secondary color
                            ),
                            onPressed: () => _openVideo(exercise["video"]!),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children:
                            series.map((entry) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Série ${entry['series']}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF676664), // Neutral color
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Peso (kg)",
                                        labelStyle: TextStyle(fontSize: 12),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        entry['weight'] =
                                            int.tryParse(value) ?? 0;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Reps",
                                        labelStyle: TextStyle(fontSize: 12),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        entry['reps'] =
                                            int.tryParse(value) ?? 0;
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed:
                                () => _saveProgress(exercise["name"]!, series),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                0xFF125c52,
                              ), // Primary color
                              padding: EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 16.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              "Salvar",
                              style: TextStyle(
                                color: Colors.white, // White text for contrast
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed:
                                () => _navigateToHistory(exercise["name"]!),
                            child: Text(
                              "Histórico",
                              style: TextStyle(
                                color: Color(0xFF125c52), // Primary color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
