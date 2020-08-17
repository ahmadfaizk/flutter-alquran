import 'dart:math';

import 'package:flutter/material.dart';

class OctagonalContainer extends StatelessWidget {
  final double size;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final Widget child;

  OctagonalContainer(
      {@required this.size,
      @required this.borderWidth,
      this.borderColor,
      this.backgroundColor = Colors.white,
      this.child});

  @override
  Widget build(BuildContext context) {
    double childSize = _getChildSize(size);
    var theme = Theme.of(context);
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              height: childSize,
              width: childSize,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: borderColor ?? theme.primaryColor,
                        width: borderWidth)),
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: SizedBox(
                height: childSize,
                width: childSize,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: borderColor ?? theme.primaryColor,
                          width: borderWidth)),
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Padding(
                padding: EdgeInsets.all(borderWidth),
                child: SizedBox(
                  height: childSize - 2 * borderWidth,
                  width: childSize - 2 * borderWidth,
                  child: Container(
                    color: theme.canvasColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(borderWidth),
              child: SizedBox(
                height: childSize - 2 * borderWidth,
                width: childSize - 2 * borderWidth,
                child: Container(
                  color: theme.canvasColor,
                  child: Center(child: child),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getChildSize(double size) {
    return (size * sqrt(2)) / 2;
  }
}
