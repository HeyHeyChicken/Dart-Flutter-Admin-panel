import 'package:flutter/material.dart';
import 'Layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Safran",
      theme: ThemeData(
        primaryColor: const MaterialColor(
          0xFF3b87cc, <int, Color>{
            50: Color(0xFF3b87cc),
            100: Color(0xFF3b87cc),
            200: Color(0xFF3b87cc),
            300: Color(0xFF3b87cc),
            400: Color(0xFF3b87cc),
            500: Color(0xFF3b87cc),
            600: Color(0xFF3b87cc),
            700: Color(0xFF3b87cc),
            800: Color(0xFF3b87cc),
            900: Color(0xFF3b87cc),
          }
        )
      ),
      home: Layout()
    );
  }
}