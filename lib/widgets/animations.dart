import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final double begin;
  final double end;
  final durationY;

  FadeAnimation(this.delay, @required this.durationY, @required this.begin,
      @required this.end, this.child);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final tween = MultiTrackTween([
      // ignore: deprecated_member_use
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      // ignore: deprecated_member_use
      Track("translateY").add(
          Duration(milliseconds: durationY), Tween(begin: begin, end: end),
          curve: Curves.easeInToLinear),
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(
              0,
              animation["translateY"],
            ),
            child: child),
      ),
    );
  }
}

transitionAnimation(page, dx, dy) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, animationTime, child) {
        var begin = Offset(dx, dy);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      pageBuilder: (context, animation, animationTime) {
        return page;
      });
}
