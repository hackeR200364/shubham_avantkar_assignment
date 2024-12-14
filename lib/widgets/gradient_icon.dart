import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key,
    required this.icon,
    required this.gradient,
  });

  final String icon;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: SvgPicture.asset(
        icon,
        width: 24,
      ),
    );
  }
}
