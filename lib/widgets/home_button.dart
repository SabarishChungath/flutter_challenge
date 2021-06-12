import 'package:flutter/material.dart';
import 'dart:math' as Math;

class HomeButton extends StatelessWidget {
  const HomeButton(
      {Key key,
      @required this.onPress,
      @required this.length,
      @required this.bgColor,
      @required this.borderColor,
      @required this.child})
      : super(key: key);

  final Widget child;
  final Function onPress;
  final double length;
  final Color bgColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: length,
            width: length,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.86),
              border: Border.all(color: borderColor, width: 1.5),
            ),
          ),
          Container(
            height: length + 1,
            width: length / 3 + 5,
            color: bgColor,
          ),
          Transform.rotate(
            angle: Math.pi / 2,
            child: Container(
              height: length + 1,
              width: length / 3 + 5,
              color: bgColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
