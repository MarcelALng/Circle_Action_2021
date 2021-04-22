import 'package:circle_action2021/controllers/action_controller.dart';
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
  double _animBegin;
  double _animEnd;
  final ActionController _controller = ActionController();

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 8000));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    // as AnimationController; /*quick fix added by suggestion*/
    _animBegin = 0.0; // number beginning position of arrow
    _animEnd = _controller.getRandomPosition(); // end of position arrow
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
              turns:
                  Tween(begin: _animBegin, end: _animEnd).animate(_animation),
              child: GestureDetector(
                onTap: () {
                  _animationController.forward();
                  if (_animationController.status ==
                      AnimationStatus.completed) {
                    setState(() {
                      print('ancienne valeur est $_animEnd');
                      _animBegin = _animEnd - _animEnd.truncate();
                      //give new value to _animBegin
                      print('nouvelle valeur $_animBegin');
                      _animEnd = _controller.getRandomPosition();
                    });
                    _animationController.reset();
                    _animationController.forward();
                  }
                },
                child: Image.asset('assets/arrow.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
