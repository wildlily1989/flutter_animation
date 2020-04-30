import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

//======================================StatefulWidget=================================//
class LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogoAppState();
    throw UnimplementedError();
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween<double> tween = new Tween(begin: 0.0,end: 300.0);
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(microseconds: 2000000), vsync: this);
    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
   animation.addStatusListener((status) {
      print("status = $status");
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

//  Widget build(BuildContext context) {
//    return new AnimatedLogo(animation: animation);
//    throw UnimplementedError();
//  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: animation.value,
          width: animation.value,
          child: new FlutterLogo(),
        )
//    return new AnimatedLogo(
//      animation: animation,
//    );
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//======================================AnimatedWidget=================================//
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
    throw UnimplementedError();
  }
}
void main() {
  runApp(new LogoApp());
}
