import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/client_panel.dart';
import 'screens/home.dart';
import 'screens/materiais.dart';
import 'screens/receitas.dart';
import 'screens/chat.dart';
import 'screens/prescricoes.dart';
import 'screens/weekly_meal_plan.dart';
import 'screens/saiba_mais.dart';
import 'screens/change_password.dart';
import 'screens/notifications.dart';
import 'screens/help.dart';
import 'screens/about.dart';
import 'screens/workouts.dart'; // Ensure this import is present
import 'screens/goals.dart'; // Import the Goals screen
import 'screens/appointment_details.dart'; // Import the AppointmentDetails screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coelho App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF402819), // Primary color
          secondary: Color(0xFFdfccb2), // Secondary color
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/onboarding', // Start with the onboarding screen
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/client-panel':
            (context) => ClientPanel(), // Main screen with navigation
        '/materiais': (context) => MateriaisScreen(),
        '/receitas': (context) => ReceitasScreen(),
        '/chat': (context) => ChatScreen(),
        '/prescricoes': (context) => PrescricoesScreen(),
        '/weekly-meal-plan': (context) => WeeklyMealPlanScreen(),
        '/saiba-mais': (context) => SaibaMaisScreen(),
        '/change-password': (context) => ChangePasswordScreen(), // New route
        '/notifications': (context) => NotificationsScreen(), // New route
        '/help': (context) => HelpScreen(), // New route
        '/about': (context) => AboutScreen(), // New route
        '/workouts':
            (context) => WorkoutsScreen(), // Ensure this route is correct
        '/goals': (context) => GoalsScreen(), // Register Goals screen
        '/appointment-details':
            (context) =>
                AppointmentDetailsScreen(), // Register AppointmentDetails screen
      },
    );
  }
}
