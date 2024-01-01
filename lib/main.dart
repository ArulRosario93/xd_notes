import 'package:flutter/material.dart';
import 'package:xd_notes/pages/Homepage/homepage.dart';
import 'pages/landingpage/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstPage(),
      theme: ThemeData(primarySwatch: MaterialColor(Colors.white.value, const <int, Color>{
        50: Color.fromARGB(255, 255, 255, 255),
        100: Color.fromARGB(255, 255, 255, 255),
        200: Color.fromARGB(255, 255, 255, 255),
        300: Color.fromARGB(255, 255, 255, 255),
        400: Color.fromARGB(255, 255, 255, 255),
        500: Color.fromARGB(255, 255, 255, 255),
        600: Color.fromARGB(255, 255, 255, 255),
        700: Color.fromARGB(255, 255, 255, 255),
        800: Color.fromARGB(255, 255, 255, 255),
        900: Color.fromARGB(255, 255, 255, 255),})),
    );
  }
}