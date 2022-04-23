import 'package:flutter/material.dart';

import 'ConfigurationAttribute.dart';

@Configuration('Color')
class ColorOption{
  late String buttonHexColor;
  late String transitionHexColor;
  late String textHexColor;
  late String menuItemHexColor;

  Color buttonColor = Colors.blue;
  late Color transitionColor;
  Color textColor = Colors.white;
  late Color menuItemColor;
}

