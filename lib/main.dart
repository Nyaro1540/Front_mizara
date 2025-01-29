import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'pages/login.dart';

void main() {
  runApp(const MizaraApp());
}

class MizaraApp extends StatelessWidget {
  const MizaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir la barre de statut en noir
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Mizara',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF40B3A2),
      primary: const Color(0xFF40B3A2),
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
  },
    );
  }
}