import 'package:flutter/material.dart';


//class that makes icons have gradient. Used in ListTile
class GradientIcon extends StatelessWidget {
  const GradientIcon(
      this.icon,
      this.size,
      this.gradient, {Key? key}
      ) : super(key: key);

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.6,
        height: size * 1.6,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}