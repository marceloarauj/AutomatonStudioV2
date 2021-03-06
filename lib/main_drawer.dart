import 'dart:io';

import 'package:automaton_studio_v2/cubics/main_drawer_cubic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key("Drawer"),
      child: ListView(
        children: _Options(context)
      )
    );
  }

  DrawerHeader _Header(){
    return const DrawerHeader(
      key: Key("DrawerHeader"),
      child: Text("Operations"),
      decoration: BoxDecoration()
      );
  }


  List<Widget> _Options(BuildContext context){
    List<Widget> elements = [];

    elements.add(
      _DrawerElement("Home", Key("Home"), Icons.home, null, ()=>{
        context.read<ViewBloc>().navigateTo(InitState()),
        Navigator.of(context).pop()
      })
    );

    elements.add(
      _DrawerElement("New Project", Key("NewProject"), Icons.star_border_sharp, Colors.yellow, ()=>{
        context.read<ViewBloc>().navigateTo(NewProjectState()),
        Navigator.of(context).pop()      
      })
    );

    elements.add(
      _DrawerElement("Load Project", Key("LoadProject"), Icons.folder_open_rounded,null, ()=>{
        context.read<ViewBloc>().navigateTo(LoadProjectState()),
        Navigator.of(context).pop()
      })
    );

    elements.add(
      _DrawerElement("Import from Google Drive", Key("GDrive"), Icons.add_to_drive,null, ()=>{
        context.read<ViewBloc>().navigateTo(ImportFromGoogleDriveState()),
        Navigator.of(context).pop()
      })
    );

    elements.add(
      _DrawerElement("Configurations", Key("Configurations"), Icons.settings,null, ()=>{
        context.read<ViewBloc>().navigateTo(ConfigurationsState()),
        Navigator.of(context).pop()
      })
    );

    elements.add(
      _DrawerElement("Tutorials", Key("Tutorials"), Icons.help_outline_outlined,null, ()=>{
        context.read<ViewBloc>().navigateTo(TutorialState()),
        Navigator.of(context).pop()
      })
    );

    elements.add(
      _DrawerElement("About", Key("About"), Icons.info_outlined, null, ()=>{
        context.read<ViewBloc>().navigateTo(AboutState()),
        Navigator.of(context).pop()
      })
    );
    
    if(!kIsWeb)
      elements.add(
        _DrawerElement("Exit", Key("Exit"), Icons.exit_to_app, null, ()=>{
          exit(0)
        })
      );

    return elements;
  }

  ListTile _DrawerElement(String title, 
                                 Key key, 
                                 IconData icon, 
                                 Color? iconColor, 
                                 Function onClick){

    return ListTile(
      key:  key,
      title: Text(title),
      leading: Icon(icon, color: iconColor),
      onTap: () => onClick.call(),
    );
  }
}

