import 'package:flutter/material.dart';

import 'package:circle_action2021/screens/home_screen.dart';

void main() {
  runApp(CircleAction());
}

class CircleAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Circle Action",
      home: HomeScreen(),
    );
  }
}
