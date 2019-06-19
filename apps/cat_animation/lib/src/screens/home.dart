//Packages Imports
import 'dart:math';
import 'package:flutter/material.dart';

//Pages Imports
import '../widgets/cat.dart';

//Widget
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Widget State Class
class _HomeState extends State<Home> with TickerProviderStateMixin {
  //Variables and Keys
  Animation<double> catAnimation;
  AnimationController catAnimationController;
  Animation<double> flapsAnimation;
  AnimationController flapsAnimationController;
  //InitState Method
  @override
  void initState() {
    super.initState();

    catAnimationController = AnimationController(
      duration: Duration(microseconds: 800),
      vsync: this,
    );

    catAnimation = Tween(begin: -45.0, end: -80.0).animate(CurvedAnimation(
      parent: catAnimationController,
      curve: Curves.easeIn,
    ));
    // Tween descreve os limites da variacao de posicao
    // CurvedAnimation descreve a aceleracao da animacao
    // duration do AnimationController descreve o tempo gasto
    flapsAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    flapsAnimation =
        Tween(begin: pi * 0.6, end: pi * 0.70).animate(CurvedAnimation(
      parent: flapsAnimationController,
      curve: Curves.elasticIn,
    ));
    flapsAnimation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        flapsAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        flapsAnimationController.forward();
      }
    });
    flapsAnimationController.forward();
  }

  //Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('The is something in the box...'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              _buildCatAnimation(),
              _buildCatsBox(),
              _buildLeftFlap(),
              _buildRightFlap()
            ],
          ),
        ),
        onTap: onTapCatAnimation,
      ),
    );
  }

  //Other Methods
  AnimatedBuilder _buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (BuildContext context, Widget child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }

  onTapCatAnimation() {
    flapsAnimationController.stop();
    if (catAnimationController.status == AnimationStatus.completed) {
      flapsAnimationController.forward();
      catAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.dismissed) {
      flapsAnimationController.stop();
      catAnimationController.forward();
    }
  }

  Container _buildCatsBox() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent[700],
          border: Border.all(
            color: Colors.grey[900],
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 200.0,
        width: 200.0);
  }

  Positioned _buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: flapsAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent[700],
            border: Border.all(
              color: Colors.grey[900],
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 10.0,
          width: 125.0,
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            angle: flapsAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
      ),
    );
  }

  Positioned _buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: flapsAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent[700],
            border: Border.all(
              color: Colors.grey[900],
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 10.0,
          width: 125.0,
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            angle: -flapsAnimation.value,
            alignment: Alignment.topRight,
            child: child,
          );
        },
      ),
    );
  }
  /**/
}
//Classes
