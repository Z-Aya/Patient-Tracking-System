import 'package:flutter/material.dart';
import 'screens/auth_screen.dart'; // Page d'authentification
import 'screens/dashboard_screen.dart'; // Tableau de bord
import 'package:suivi_patients/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suivi des Patients',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(), // Page de connexion
        '/dashboard': (context) => DashboardScreen(), // Tableau de bord
      },
    );
  }
}
