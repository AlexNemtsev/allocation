import 'package:flutter/material.dart';

void main() {
  runApp(Allocation());
}

class Allocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MainScreen(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Color(0xFF388E3C) ),
          ),
        ),
      ),
    );
  }
}
