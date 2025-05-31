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

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Metas",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Redesigned Input Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_task,
                          color: Color(0xFF125c52),
                          size: 28,
                        ), // Icon for the section
                        SizedBox(width: 8),
                        Text(
                          "Criar Nova Meta",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF125c52), // Primary color
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _goalController,
                      decoration: InputDecoration(
                        labelText: "Descrição da Meta",
                        labelStyle: TextStyle(
                          color: Color(0xFF125c52),
                        ), // Primary color
                        filled: true,
                        fillColor: Color(
                          0xFFdbdad5,
                        ).withOpacity(0.2), // Neutral color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xFF125c52),
                          ), // Primary color
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _deadlineController,
                      decoration: InputDecoration(
                        labelText: "Prazo (dd/mm/aaaa)",
                        labelStyle: TextStyle(
                          color: Color(0xFF125c52),
                        ), // Primary color
                        filled: true,
                        fillColor: Color(
                          0xFFdbdad5,
                        ).withOpacity(0.2), // Neutral color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xFF125c52),
                          ), // Primary color
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity, // Make the button take full width
                      child: ElevatedButton.icon(
                        onPressed: _addGoal,
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text(
                          "Adicionar Meta",
                          style: TextStyle(
                            color: Colors.white, // White text for contrast
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF125c52), // Primary color
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Goals List Section
            Text(
              "Suas Metas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child:
                  _goals.isEmpty
                      ? Center(
                        child: Text(
                          "Nenhuma meta adicionada.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF676664), // Neutral color
                          ),
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
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: Icon(
                                goal["completed"]
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color:
                                    goal["completed"]
                                        ? Color(0xFF24b5a1)
                                        : Color(
                                          0xFF125c52,
                                        ), // Primary/Secondary color
                                size: 28,
                              ),
                              title: Text(
                                goal["goal"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      goal["completed"]
                                          ? Color(0xFF24b5a1)
                                          : Color(
                                            0xFF125c52,
                                          ), // Primary/Secondary color
                                  decoration:
                                      goal["completed"]
                                          ? TextDecoration.lineThrough
                                          : null,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Prazo: ${goal["deadline"]}",
                                    style: TextStyle(
                                      color: Color(0xFF676664), // Neutral color
                                    ),
                                  ),
                                  Text(
                                    "Criado em: ${DateFormat('dd/MM/yyyy').format(goal["createdAt"])}",
                                    style: TextStyle(
                                      color: Color(0xFF676664), // Neutral color
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _deleteGoal(index),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      goal["completed"]
                                          ? Icons.undo
                                          : Icons.check,
                                      color:
                                          goal["completed"]
                                              ? Colors.grey
                                              : Color(
                                                0xFF24b5a1,
                                              ), // Secondary color
                                    ),
                                    onPressed:
                                        () => _toggleGoalCompletion(index),
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
    );
  }
}
