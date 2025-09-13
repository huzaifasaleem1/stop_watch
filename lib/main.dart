import 'package:flutter/material.dart';
import 'package:provider/provider.dart';     // 👈 is line ko add karo
import 'stopwatch_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StopwatchProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
