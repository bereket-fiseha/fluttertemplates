import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlyingJetWidget extends StatelessWidget {
  const FlyingJetWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Jet"),
        leading: const Icon(Icons.air),
      ),
      body: FlyingJet());
}

class FlyingJet extends StatefulWidget {
  const FlyingJet({super.key});

  @override
  State<FlyingJet> createState() => _FlyingJet();
}

class _FlyingJet extends State<FlyingJet> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _verticalAnimation;
  double _offsetY = 300;
  double _offsetX = 0;
  double _offsetRotate = 0;
  double _offsetBegin = -0;

  double _offsetEnd = 150;
  bool gameover = false;
  late var containerDx = 0.0;
  @override
  void initState() {
    //   var screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement initState
    super.initState();

//    containerDx = math.Random().nextDouble() * 150;
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _controller.addListener(() {
      var offset = _verticalAnimation.value;

      if (offset.dy - _offsetY > 100 && _offsetX == offset.dx) {
        setState(() {
          gameover = true;
        });
      }
      if (offset.dy > 700) {
        if ((_controller.isCompleted || _controller.isDismissed) && !gameover) {
          _controller.forward(from: 0);
        }
      }
      setState(() {});
    });

    _controller.forward();
  }

  void buttonClicked() {
    // _offsetBegin = _offsetEnd;
    // _offsetEnd -= 50;
    setState(() {
      _offsetBegin = _offsetEnd;
      _offsetEnd -= 50;
    });
    _controller.forward();
  }

  void moveLeft() {
    setState(() {
      _offsetX -= 30;
    });
  }

  void moveRight() {
    setState(() {
      _offsetX += 30;
    });
  }

  void moveUp() {
    setState(() {
      _offsetY -= 30;
    });
  }

  void moveDown() {
    setState(() {
      _offsetY += 30;
    });
  }

  void rotateClockWise() {
    setState(() {
      _offsetRotate = _offsetRotate >= 270 ? 0 : _offsetRotate + math.pi / 12;
    });
  }

  void rotateAntiClockWise() {
    setState(() {
      _offsetRotate = _offsetRotate <= -270 ? 0 : _offsetRotate - math.pi / 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // _verticalAnimation = Tween<Offset>(
    //         begin: Offset(0, screenHeight / 3),
    //         end: Offset(0, -screenHeight / 3))
    //     .animate(_controller);
    _verticalAnimation = Tween<Offset>(
            begin: Offset(containerDx, -screenHeight),
            end: Offset(containerDx, screenHeight + 100))
        .animate(_controller);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Transform.translate(
              offset: _verticalAnimation.value,
              child: Container(width: 50, height: 50, color: Colors.green)),
          gameover
              ? Center(
                  child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.not_accessible),
                        Text(
                          "Game Over",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                gameover = false;
                              });
                              _controller.forward(from: 0);
                            },
                            icon: const Icon(Icons.rotate_right)),
                        IconButton(
                            onPressed: () => {Navigator.pop(context)},
                            icon: const Icon(FontAwesomeIcons.arrowLeft))
                      ],
                    )
                  ],
                ))
              : Container(),
          Center(
            child: Transform.translate(
              offset: Offset(_offsetX, _offsetY),
              child: Transform.rotate(
                origin: Offset(0, 0),
                angle: _offsetRotate,
                child: Container(
                    child: Icon(FontAwesomeIcons.jetFighterUp,
                        size: screenHeight / 15, color: Colors.deepOrange)),
              ),
            ),
          ),
          SizedBox(height: screenHeight / 15),
          SizedBox(height: screenHeight / 15),
          SizedBox(height: screenHeight / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () => moveLeft(),
                  child: Icon(Icons.arrow_circle_left)),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  OutlinedButton(
                      onPressed: () => moveUp(),
                      child: Icon(Icons.arrow_circle_up)),
                  Row(
                    children: [
                      OutlinedButton(
                          onPressed: () => rotateAntiClockWise(),
                          child: Icon(Icons.rotate_90_degrees_ccw)),
                      SizedBox(
                        width: 3,
                      ),
                      OutlinedButton(
                          onPressed: () => rotateClockWise(),
                          child: Icon(Icons.rotate_90_degrees_cw)),
                    ],
                  ),
                  OutlinedButton(
                      onPressed: () => moveDown(),
                      child: Icon(Icons.arrow_circle_down)),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              OutlinedButton(
                  onPressed: () => moveRight(),
                  child: Icon(Icons.arrow_circle_right)),
            ],
          )
        ],
      ),
    );
  }
}
