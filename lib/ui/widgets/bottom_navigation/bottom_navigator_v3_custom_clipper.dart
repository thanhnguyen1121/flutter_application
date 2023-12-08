import 'package:flutter/material.dart';

class BottomNavigatorV3CustomClipper extends CustomClipper<Path> {
  double radius;

  BottomNavigatorV3CustomClipper({this.radius = 20});

  double centerCircle = 45;

  @override
  Path getClip(Size size) {
    // centerCircle = size.height / 2;
    var path = Path();

    path.lineTo(size.width, 0);

    path.lineTo(size.width / 2 - centerCircle - 10, 0);
    path.quadraticBezierTo(size.width / 2 - centerCircle, 0, size.width / 2 - centerCircle + 10, 10);
    path.quadraticBezierTo(size.width / 2, 50, size.width / 2 + centerCircle - 10, 10);
    path.quadraticBezierTo(size.width / 2 + centerCircle, 0, size.width / 2 + centerCircle + 10, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
