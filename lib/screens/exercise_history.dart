import 'package:flutter/material.dart';

class ExerciseHistoryScreen extends StatefulWidget {
  final String exerciseName;
  final List<Map<String, dynamic>> history;

  ExerciseHistoryScreen({required this.exerciseName, required this.history});

  @override
  _ExerciseHistoryScreenState createState() => _ExerciseHistoryScreenState();
}

class _ExerciseHistoryScreenState extends State<ExerciseHistoryScreen> {
  DateTime? _selectedDate;
  int? _goalWeight;
  int? _goalReps;

  List<Map<String, dynamic>> get _filteredHistory {
    if (_selectedDate == null) return widget.history;
    return widget.history.where((entry) {
      final entryDate = DateTime.now(); // Replace with actual date if stored
      return entryDate.year == _selectedDate!.year &&
          entryDate.month == _selectedDate!.month &&
          entryDate.day == _selectedDate!.day;
    }).toList();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _setGoal() {
    if (_goalWeight != null && _goalReps != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Meta definida: $_goalWeight kg x $_goalReps reps"),
          backgroundColor: Color(0xFF24b5a1), // Secondary color
          duration: Duration(seconds: 2),
        ),
      );
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
          "Histórico - ${widget.exerciseName}",
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
            // Date Filter Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today, color: Color(0xFF125c52)),
                  label: Text(
                    _selectedDate == null
                        ? "Filtrar por Data"
                        : "Data: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                    style: TextStyle(color: Color(0xFF125c52)), // Primary color
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = null;
                    });
                  },
                  child: Text(
                    "Limpar Filtro",
                    style: TextStyle(color: Color(0xFF125c52)), // Primary color
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Goal Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Definir Meta",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF125c52), // Primary color
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Peso (kg)",
                              labelStyle: TextStyle(color: Color(0xFF125c52)),
                              filled: true,
                              fillColor: Color(0xFFdbdad5).withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Color(0xFF125c52), // Primary color
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _goalWeight = int.tryParse(value);
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Reps",
                              labelStyle: TextStyle(color: Color(0xFF125c52)),
                              filled: true,
                              fillColor: Color(0xFFdbdad5).withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Color(0xFF125c52), // Primary color
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _goalReps = int.tryParse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _setGoal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF125c52), // Primary color
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          "Salvar Meta",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // White text for contrast
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // History List Section
            Expanded(
              child:
                  _filteredHistory.isEmpty
                      ? Center(
                        child: Text(
                          "Nenhum histórico disponível.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF676664), // Neutral color
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: _filteredHistory.length,
                        itemBuilder: (context, index) {
                          final entry = _filteredHistory[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(
                                  0xFFdbdad5,
                                ).withOpacity(0.5),
                                child: Icon(
                                  Icons.fitness_center,
                                  color: Color(0xFF125c52), // Primary color
                                ),
                              ),
                              title: Text(
                                "Série ${entry['series']}: ${entry['weight']}kg x ${entry['reps']} reps",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF125c52), // Primary color
                                ),
                              ),
                              subtitle: Text(
                                "Data: ${DateTime.now().toLocal()}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF676664), // Neutral color
                                ),
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
