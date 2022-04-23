import 'package:flutter/material.dart';
import 'ConfigurationAttribute.dart';

@Configuration("Language")
class LanguageOption {
  
  LanguageOption(String Description, String image){
    this.image = Image.asset(
      'icons/flags/png/${image}.png'
      ,package: 'country_icons'
      ,width: 35
      );
    this.Description = Description;
  }

  Image? image;
  String? Description;
}