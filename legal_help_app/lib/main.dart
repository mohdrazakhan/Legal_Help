// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/act_selection_screen.dart'; // Import our new selection screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Legal Help',
      // This is the modern way to set themes
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: ActSelectionScreen(),
    );
  }
}
