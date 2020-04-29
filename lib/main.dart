import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogoAppState();
    throw UnimplementedError();
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
 Animation<double> animation;
 AnimationController controller;

 @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(
          microseconds: 2000),
        vsync: this);
    animation = new Tween(begin: 0.0,end: 300.0).animate(controller)
    ..addListener(() {
      setState(() {

      });
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
void main() {
  runApp(new LogoApp());
}
