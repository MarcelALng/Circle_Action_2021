import 'package:circle_action2021/controllers/action_controller.dart';
import 'package:circle_action2021/models/action_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _animationController.addStatusListener((status) {}); // to check if need
    print('InitState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // show dialog when animation arrow is finished
        ActionModel _action = _controller.getActions();
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Center(
                  child: Text(
                    "Action!!!",
                    style: GoogleFonts.bangers(fontSize: 40.0),
                  ),
                ),
                children: [
                  Text(
                    _action.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.indieFlower(fontSize: 30.0),
                  ),
                ],
                contentPadding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              );
            });
      }
    });
    print('DidChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // to stop and destroy? animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Circle Action!",
            style: GoogleFonts.bangers(fontSize: 70.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Start the wheel to get a challenge",
            style: GoogleFonts.bangers(fontSize: 35.0),
            textAlign: TextAlign.center,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                Image.asset('assets/wheel.png'),
                RotationTransition(
                  turns: Tween(begin: _animBegin, end: _animEnd)
                      .animate(_animation),
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
        ],
      ),
    );
  }
}
