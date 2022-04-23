import 'package:flutter/material.dart';

class ScreenUtils {
  
  static double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double getPercentWidth(BuildContext context, int percent){
    return getWidth(context) * (percent / 100);
  }

  static double getPercentHeight(BuildContext context, int percent){
    return getWidth(context) * (percent / 100); 
  }
}