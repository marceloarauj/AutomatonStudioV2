import 'package:automaton_studio_v2/main_drawer.dart';
import 'package:automaton_studio_v2/screens/cubit_screen_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automaton Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Baloo',
      ),
      home: MainCubitManager()
    );
  }
}
