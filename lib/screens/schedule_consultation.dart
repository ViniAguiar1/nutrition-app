import 'package:flutter/material.dart';

class ScheduleConsultationScreen extends StatefulWidget {
  @override
  _ScheduleConsultationScreenState createState() =>
      _ScheduleConsultationScreenState();
}

class _ScheduleConsultationScreenState
    extends State<ScheduleConsultationScreen> {
  DateTime? _selectedDate;
  String? _selectedTime;
  String? _selectedConsultationType;

  final List<String> _availableTimes = ["08:00", "10:00", "14:00", "16:00"];

  final List<String> _consultationTypes = [
    "Consulta Inicial",
    "Acompanhamento",
    "Retorno",
  ];

  void _scheduleConsultation() {
    if (_selectedDate != null &&
        _selectedTime != null &&
        _selectedConsultationType != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Consulta agendada com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context); // Navigate back to the previous screen
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
          "Agendar Consulta",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Color(0xFF125c52)),
            onPressed: () {
              // Handle help action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Section
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            SizedBox(height: 8), // Reduced gap
            // Time Dropdown
            DropdownButtonFormField<String>(
              value: _selectedTime,
              items:
                  _availableTimes
                      .map(
                        (time) =>
                            DropdownMenuItem(value: time, child: Text(time)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Horário",
                labelStyle: TextStyle(
                  color: Color(0xFF125c52),
                ), // Primary color
                filled: true,
                fillColor: Color(0xFFdbdad5).withOpacity(0.2), // Neutral color
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
            ),
            SizedBox(height: 16),

            // Consultation Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedConsultationType,
              items:
                  _consultationTypes
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedConsultationType = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Tipo de Consulta",
                labelStyle: TextStyle(
                  color: Color(0xFF125c52),
                ), // Primary color
                filled: true,
                fillColor: Color(0xFFdbdad5).withOpacity(0.2), // Neutral color
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
            ),
            SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Cancel and go back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFdbdad5), // Neutral color
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ), // Larger button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        fontSize: 18, // Larger font size
                        color: Color(0xFF125c52), // Primary color
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: _scheduleConsultation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF125c52), // Primary color
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ), // Larger button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Confirmar",
                      style: TextStyle(
                        fontSize: 18, // Larger font size
                        color: Colors.white, // White text for contrast
                      ),
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
}
