import 'package:flutter/material.dart';

import 'bot_nav_bar.dart';

void main() {
  runApp(const Allocation());
}

class Allocation extends StatelessWidget {
  const Allocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BotNavBar(),
      // theme: ThemeData.light().copyWith(
      //   appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
      //   textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(
      //       textStyle: TextStyle(color: Color(0xFF388E3C) ),
      //     ),
      //   ),
      // ),
    );
  }
}
