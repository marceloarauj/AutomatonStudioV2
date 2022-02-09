import 'package:automaton_studio_v2/cubics/language_cubic.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

abstract class Language {
  
  String? state = null;
  
  Language(BuildContext context){
    state = context.read<LanguageBloc>().state;
  }

  String text(Map<String,String> map){
    return map[state] ?? "Language Error - Not found";
  }
}