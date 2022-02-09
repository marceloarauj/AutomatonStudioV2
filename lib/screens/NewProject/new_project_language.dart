import 'package:automaton_studio_v2/cubics/language_cubic.dart';
import 'package:automaton_studio_v2/screens/cubic_language_manager.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewProjectLanguage extends Language{
  NewProjectLanguage(BuildContext context) : super(context);

  String get newProject => text({"en-us": "New Project", "pt-br": "Novo Projeto"});

}