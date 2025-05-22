import 'package:codeforces_finder/screens/home.dart';
import 'package:codeforces_finder/themes/light_theme.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: HomeScreen());
  }
}
