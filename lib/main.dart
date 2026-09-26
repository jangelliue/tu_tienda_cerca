import 'package:flutter/material.dart';
import 'pantallas/login.dart';

void main() {
  runApp(const TuTiendaCercaApp());
}

class TuTiendaCercaApp extends StatelessWidget {
  const TuTiendaCercaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Tienda Cerca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const LoginScreen(),
    );
  }
}