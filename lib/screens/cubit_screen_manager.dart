import 'package:automaton_studio_v2/main_cubit_drawer.dart';
import 'package:automaton_studio_v2/main_drawer.dart';
import 'package:automaton_studio_v2/screens/About/about_view.dart';
import 'package:automaton_studio_v2/screens/Configurations/configurations_view.dart';
import 'package:automaton_studio_v2/screens/Home/home_view.dart';
import 'package:automaton_studio_v2/screens/ImportFromGoogleDrive/import_from_google_drive.dart';
import 'package:automaton_studio_v2/screens/LoadProject/load_project_view.dart';
import 'package:automaton_studio_v2/screens/NewProject/new_project_view.dart';
import 'package:automaton_studio_v2/screens/Tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubitManager extends StatelessWidget{
  
  Widget _screen(BuildContext context){

    return BlocBuilder<ViewBloc, ViewState>(builder: (context,state){

      if(state is InitState) return HomeView();
      if(state is TutorialState) return TutorialView();
      if(state is NewProjectState) return NewProjectView();
      if(state is LoadProjectState) return LoadProjectView();
      if(state is ConfigurationsState) return ConfigurationsView();
      if(state is ImportFromGoogleDriveState) return ImportFromGoogleDriveView();
      if(state is AboutState) return AboutView();

      return HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider<ViewBloc>(
        create: (BuildContext context) => ViewBloc(),
      )
    ], 
    child: Scaffold(
      appBar: AppBar(
        title: Text('Automaton Studio'),
        centerTitle: true,
      ),
      body:  _screen(context),
      drawer: MainDrawer()
    ));
  }
}