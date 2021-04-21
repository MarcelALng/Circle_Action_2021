import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin // animation controller
{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    // as AnimationController; /*quick fix added by suggestion*/
    _animationController.forward(); // to launch Animation controller
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            Image.asset('assets/wheel.png'),
            RotationTransition(
              turns: _animation,
              child: Image.asset('assets/arrow.png'),
            ),
          ],
        ),
      ),
    );
  }
}
