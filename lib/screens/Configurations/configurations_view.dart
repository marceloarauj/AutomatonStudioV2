import 'package:automaton_studio_v2/utils/ScreenUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../cubics/language_cubic.dart';
import '../cubic_language_manager.dart';
import 'Models/ColorOption.dart';
import 'Models/LanguageOption.dart';

class ConfigurationsLanguage extends Language {
  ConfigurationsLanguage(BuildContext context) : super(context);

  String get language => text({'pt-br': 'Linguagem', 'en-us': 'Language'});
  String get buttonColor => text({'pt-br': 'Cor do botão', 'en-us': 'Button color'});
  String get colorDialog => text({'pt-br': 'Selecione a cor', 'en-us': 'Select the color'});
  String get fontColor => text({'pt-br': 'Cor da fonte', 'en-us': 'Font color'});
  String get transitionColor => text({'pt-br': 'Cor da transição', 'en-us': 'Transition color'});
  String get stateColor => text({'pt-br': 'Cor do estado', 'en-us': 'State color'});
  String get initialStateColor => text({'pt-br': 'Cor do estado inicial', 'en-us': 'Initial state color'});
  String get finalStateColor => text({'pt-br': 'Cor do estado final', 'en-us': 'Final state color'});
}

class ConfigurationsView extends StatefulWidget {
  ConfigurationsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfigurationsView();
}

class _ConfigurationsView extends State<ConfigurationsView> {
  late LanguageOption languageSelected;
  late List<DropdownMenuItem<LanguageOption>> languages;
  ColorOption colorOption = ColorOption();

  @override
  Widget build(BuildContext context) {
    var text = ConfigurationsLanguage(context);
    languages = _getLanguages();
    languageSelected = getStateLanguage(context);

    return Container(
        width: ScreenUtils.getWidth(context),
        height: ScreenUtils.getHeight(context),
        child: Column(
          children: [
            Row(children: [
              Text(text.language + ": "),
              Container(
                  width: ScreenUtils.getPercentWidth(context, 25),
                  child: DropdownButton<LanguageOption>(
                      value: languageSelected,
                      elevation: 15,
                      items: languages,
                      isExpanded: true,
                      onChanged: (value) {
                        languageSelected = value!;
                        setStateLanguage(context, value.Description);
                      }))
            ]),
            Row(children: [
              Text(text.buttonColor + ": "),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colorOption.buttonColor),
                  onPressed: () =>
                      colorDialog(text.colorDialog, setButtonColor),
                  child: Text(text.buttonColor))
            ]),
            Row(children: [
              Text(text.fontColor + ": "),
              OutlinedButton(
                  onPressed: () => colorDialog(text.colorDialog, setFontColor),
                  child: Text(text.fontColor,
                      style: TextStyle(color: colorOption.textColor)))
            ]),
            Row(children: [
              Text(text.transitionColor + ": "),
              OutlinedButton(
                  onPressed: () => colorDialog(text.colorDialog, setTransitionColor),
                  child: Icon(Icons.arrow_right_alt, size: 40, color: colorOption.transitionColor))
            ])
          ],
        ));
  }

  colorDialog(String title, Function(Color) setColor) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
                child: ColorPicker(
              key: Key("buttonColor"),
              pickerColor: Colors.green,
              onColorChanged: setColor,
            )),
          );
        });
  }

  setButtonColor(Color color) {
    setState(() {
      colorOption.buttonColor = color;
      colorOption.buttonHexColor = color.value.toRadixString(16);
    });
  }

  setFontColor(Color color) {
    setState(() {
      colorOption.textColor = color;
      colorOption.textHexColor = color.value.toRadixString(16);
    });
  }

  setTransitionColor(Color color) {
    setState(() {
      colorOption.transitionColor = color;
      colorOption.transitionHexColor = color.value.toRadixString(16);
    });
  }

  setStateLanguage(BuildContext context, String? language) {
    context.read<LanguageBloc>().changeLanguage(language!);
    setState(() {});
  }

  getStateLanguage(BuildContext context) {
    String language = context.read<LanguageBloc>().state;
    var option = languages
        .firstWhere((element) => element.value!.Description == language)
        .value;
    return option;
  }

  List<DropdownMenuItem<LanguageOption>> _getLanguages() {
    var ptbr = LanguageOption("pt-br", "br");
    var enus = LanguageOption("en-us", "us");

    return <LanguageOption>[ptbr, enus]
        .map<DropdownMenuItem<LanguageOption>>((LanguageOption value) {
      return DropdownMenuItem<LanguageOption>(
        value: value,
        child: Row(
            children: [value.image!, Text(value.Description!)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
      );
    }).toList();
  }
}
