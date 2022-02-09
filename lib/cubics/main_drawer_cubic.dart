import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class ViewState{
  const ViewState();
}

@immutable
class InitState extends ViewState{
  const InitState();
}

@immutable
class TutorialState extends ViewState{
  const TutorialState();
}

@immutable
class NewProjectState extends ViewState{
  const NewProjectState();
}

@immutable
class LoadProjectState extends ViewState{
  const LoadProjectState();
}

@immutable
class ImportFromGoogleDriveState extends ViewState{
  const ImportFromGoogleDriveState();
}

@immutable
class ConfigurationsState extends ViewState{
  const ConfigurationsState();
}

@immutable
class AboutState extends ViewState{
  const AboutState();
}

class ViewBloc extends Cubit<ViewState>{
  ViewBloc() : super(InitState());
  void navigateTo(ViewState viewState) => emit(viewState);
}