import 'package:flutter/material.dart';
import '../cubic_language_manager.dart';

class NewProjectLanguage extends Language{
  NewProjectLanguage(BuildContext context) : super(context);
  
  String get dfa => text({'pt-br':'Autômato finito determinístico', 'en-us':'Deterministic finite automaton'});
  String get ndfa => text({'pt-br':'Autômato finito não-determinístico', 'en-us':'Non-Deterministic finite automaton'});
  String get dpa => text({'pt-br':'Autômato com pilha determinístico', 'en-us':'Deterministic pushdown automaton'});
  String get tm => text({'pt-br':'Máquina de Turing', 'en-us':'Turing Machine'});
  String get regex => text({'pt-br':'Expressão regular', 'en-us':'Regular Expression'});
  String get grammar => text({'pt-br':'Gramática', 'en-us':'Grammar'});
  String get grafos => text({'pt-br':'Grafos', 'en-us':'Graphs'});

}

class NewProjectView extends StatelessWidget {
  const NewProjectView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var text = NewProjectLanguage(context);

    return Container(
      child: Text(text.dfa)
    );
  }

}