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
    animation = new CurvedAnimation(parent: controller,curve: Curves.easeIn);
//    animation = tween.animate(controller);
//      ..addListener(() {
//        setState(() {
//
//        });
//      });
//   animation.addStatusListener((status) {
//      print("status = $status");
//      if (status == AnimationStatus.completed) {
//        controller.reverse();
//      } else if (status == AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });
    controller.forward();
  }

//  Widget build(BuildContext context) {
//    return new GrowTransition(child: new LogoWidget(),animation: animation);
//    throw UnimplementedError();
//  }

  @override
  Widget build(BuildContext context) {
//    return new Center(
//        child: new Container(
//          margin: new EdgeInsets.symmetric(vertical: 10.0),
//          height: animation.value,
//          width: animation.value,
//          child: new FlutterLogo(),
//        )
//    );
    return new AnimatedLogo(
      animation: animation,
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
  static final _opactityTween = new Tween<double>(begin: 0.1,end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0,end: 300.0);
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Center(
        child: new Opacity(
          opacity: _opactityTween.evaluate(animation),
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: new FlutterLogo(),
          ),
        ),
      ),
//      child: new Container(
//        margin: new EdgeInsets.symmetric(vertical: 10.0),
//        height: animation.value,
//        width: animation.value,
//        child: new FlutterLogo(),
//      ),
    );
    throw UnimplementedError();
  }
}

//========================================AnimatedBuilder================================//
class GrowTransition extends StatelessWidget{
  final Widget child;
  final Animation<double> animation;
  GrowTransition({this.child,this.animation});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context,Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
    throw UnimplementedError();
  }
}

class LogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
    throw UnimplementedError();
  }

}
void main() {
  runApp(new LogoApp());
}
