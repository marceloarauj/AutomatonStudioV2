import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBloc extends Cubit<String> {
  LanguageBloc() : super("pt-br");
  void changeLanguage(String state) => emit(state);
}