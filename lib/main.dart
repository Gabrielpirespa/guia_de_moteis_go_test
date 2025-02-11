import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/app_widget.dart';
import 'package:guia_de_moteis_application/app/config/app_initialization/app_initialization.dart';

void main() async {
  await AppInitialization.initAppConfigurations();

  runApp(const AppWidget());
}
