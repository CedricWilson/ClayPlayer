import 'package:flutter/material.dart';

extension Extended on String{

   String clip(){
    if (this.length > 30) {
      return this.substring(0, 30);
    } else {
      return this;
    }
  }
}

extension ParseNumbers on String {
    int parseInt() {
        return int.parse(this);
    }
    double parseDouble() {
        return double.parse(this);
    }
}
