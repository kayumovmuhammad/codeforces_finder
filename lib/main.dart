import 'dart:convert';

import 'package:codeforces_finder/screens/home.dart';
import 'package:codeforces_finder/themes/light_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Map data = {};

Future<void> getData() async {
  Dio dio = Dio();
  var ans = await dio.get(
    'https://raw.githubusercontent.com/kayumovmuhammad/database_for_codeforces_finder/main/data.json',
  );

  if (ans.statusCode == 200) {
    data = jsonDecode(ans.data);
  }
}

void main() async {
  await getData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: HomeScreen());
  }
}
