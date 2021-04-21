import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:circle_action2021/screens/home_screen.dart';
import 'package:circle_action2021/controllers/action_controller.dart';

void main() {
  runApp(CircleAction());
}

class CircleAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ActionController().getRandomPosition();
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: "Circle Action",
      home: HomeScreen(),
    );
  }
}
