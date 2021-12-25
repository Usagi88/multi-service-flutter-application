import 'package:flutter/material.dart';

//class that makes icons have gradient. Used in navbar/appbar
class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  RadiantGradientMask({Key? key,
    required this.child
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Color(0xff3AC170), Color(0xff25BFA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}