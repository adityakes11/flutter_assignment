import 'package:flutter/widgets.dart';

class Sizing {
  final BuildContext context;
  Sizing(this.context);
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;
  double scale(double value) {
    // base width: 375 (iPhone-like); scale relative to actual width
    return value * (w / 375.0);
  }
}
