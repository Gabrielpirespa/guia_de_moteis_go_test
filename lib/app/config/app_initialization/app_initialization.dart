import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/app_initialization/environment/environment_manager.dart';
import 'package:guia_de_moteis_application/app/container_injection.dart';

class AppInitialization {
  static Future<void> initAppConfigurations() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setUpContainer();
    await EnvironmentManager.initializeEnvironment();
  }
}
