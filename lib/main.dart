import 'package:flutter/material.dart';
import 'package:the_river_app/periodic_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The River App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const TheRiverApp(),
    );
  }
}

class TheRiverApp extends StatelessWidget {
  const TheRiverApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PeriodicCounter(),
    );
  }
}
