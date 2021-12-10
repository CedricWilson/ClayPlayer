import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class C {
  static final Color greyTop = "DEE8FB".toColor();
  static final Color greyBottom = "EBF3FD".toColor();
  static final Color red = Colors.red;
  static final Color subTextGrey = "A4B1C7".toColor();
  static final Color borderGrey = "D2DDEF".toColor();
 

  
  static final Color TextGrey = "6C7A92".toColor();

  static final Gradient tileGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        C.greyTop,
        C.greyBottom,
      ]);
}
