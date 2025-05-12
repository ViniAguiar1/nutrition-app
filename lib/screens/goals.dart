import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Map<String, dynamic>> _goals = [];

  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  void _addGoal() {
    if (_goalController.text.isNotEmpty &&
        _deadlineController.text.isNotEmpty) {
      setState(() {
        _goals.add({
          "goal": _goalController.text,
          "deadline": _deadlineController.text,
          "createdAt": DateTime.now(), // Store the creation date
          "completed": false,
        });
      });
      _goalController.clear();
      _deadlineController.clear();
    }
  }

  void _toggleGoalCompletion(int index) {
    setState(() {
      _goals[index]["completed"] = !_goals[index]["completed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF402819), // Primary color
        title: Text("Metas", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _goalController,
                      decoration: InputDecoration(
                        labelText: "Descrição da Meta",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _deadlineController,
                      decoration: InputDecoration(
                        labelText: "Prazo (dd/mm/aaaa)",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _addGoal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF402819), // Primary color
                      ),
                      child: Text(
                        "Adicionar Meta",
                        style: TextStyle(
                          color: Color(0xFFdfccb2),
                        ), // Secondary color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Goals List
            Expanded(
              child:
                  _goals.isEmpty
                      ? Center(
                        child: Text(
                          "Nenhuma meta adicionada.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                      : ListView.builder(
                        itemCount: _goals.length,
                        itemBuilder: (context, index) {
                          final goal = _goals[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(
                                goal["goal"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      goal["completed"]
                                          ? Colors.green
                                          : Color(0xFF402819), // Primary color
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Prazo: ${goal["deadline"]}"),
                                  Text(
                                    "Criado em: ${DateFormat('dd/MM/yyyy').format(goal["createdAt"])}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  goal["completed"]
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color:
                                      goal["completed"]
                                          ? Colors.green
                                          : Colors.grey,
                                ),
                                onPressed: () => _toggleGoalCompletion(index),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
