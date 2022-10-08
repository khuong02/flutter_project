import 'package:flutter/material.dart';

class TopShape extends CustomClipper<Path> {
  final AnimationController _controller;

  TopShape._(this._controller);

  static Widget draw(Color color, String text, AnimationController controller) {
    return ClipPath(
      clipper: TopShape._(controller),
      child: ColoredBox(
        color: color,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(
      0,
      Tween<double>(begin: 0, end: size.height * 0.7655502392344498)
          .animate(_controller)
          .value,
    );

    path.cubicTo(
      size.width * 0.03,
      Tween<double>(
        begin: 0,
        end: size.height * 0.6,
      ).animate(_controller).value,
      size.width * 0.12,
      Tween<double>(
        begin: 0,
        end: size.height * 0.55,
      ).animate(_controller).value,
      size.width * 0.22,
      Tween<double>(
        begin: 0,
        end: size.height * 0.66,
      ).animate(_controller).value,
    );

    path.cubicTo(
      size.width * 0.34,
      Tween<double>(
        begin: 0,
        end: size.height * 0.79,
      ).animate(_controller).value,
      size.width * 0.39,
      Tween<double>(
        begin: 0,
        end: size.height * 0.81,
      ).animate(_controller).value,
      size.width * 0.45,
      Tween<double>(
        begin: 0,
        end: size.height * 0.74,
      ).animate(_controller).value,
    );

    path.cubicTo(
        size.width * 0.51,
        Tween<double>(
          begin: 0,
          end: size.height * 0.67,
        ).animate(_controller).value,
        size.width * 0.56,
        Tween<double>(
          begin: 0,
          end: size.height * 0.41,
        ).animate(_controller).value,
        size.width * 0.63,
        Tween<double>(
          begin: 0,
          end: size.height * 0.56,
        ).animate(_controller).value);

    path.cubicTo(
        size.width * 0.71,
        Tween<double>(
          begin: 0,
          end: size.height * 0.77,
        ).animate(_controller).value,
        size.width * 0.72,
        Tween<double>(
          begin: 0,
          end: size.height,
        ).animate(_controller).value,
        size.width * 0.78,
        Tween<double>(
          begin: 0,
          end: size.height,
        ).animate(_controller).value);

    path.cubicTo(
        size.width * 0.84,
        Tween<double>(
          begin: 0,
          end: size.height,
        ).animate(_controller).value,
        size.width * 0.89,
        Tween<double>(
          begin: 0,
          end: size.height * 0.62,
        ).animate(_controller).value,
        size.width,
        Tween<double>(
          begin: 0,
          end: size.height * 0.71,
        ).animate(_controller).value);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
