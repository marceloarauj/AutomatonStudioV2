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
                    primary: colorOption.buttonColor,
                    onPrimary: colorOption.textColor
                  ),
                  onPressed: () => colorDialog(text.colorDialog, setButtonColor),
                  child: Text(text.buttonColor))
            ]),
            Row(children: [
              Text(text.fontColor + ": "),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: colorOption.buttonColor,
                    onPrimary: colorOption.textColor
                  ),
                  onPressed: () => colorDialog(text.colorDialog, setFontColor),
                  child: Text(text.fontColor))
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
    });
  }

  setFontColor(Color color) {
    setState(() {
      colorOption.textColor = color;
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
