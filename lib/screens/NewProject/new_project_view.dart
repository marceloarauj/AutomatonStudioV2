import 'package:flutter/material.dart';

import 'new_project_language.dart';

class NewProjectView extends StatelessWidget {
  const NewProjectView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var text = NewProjectLanguage(context);

    return Container(
      child: Text(text.newProject)
    );
  }

}