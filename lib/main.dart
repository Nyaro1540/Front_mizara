import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // Import de la page d'accueil

void main() {
  runApp(const MizarApp());
}

class MizarApp extends StatelessWidget {
  const MizarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: HomePage(), // Appel de la page d'accueil
    );
  }
}
