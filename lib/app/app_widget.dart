import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/config/themes/app_theme_data.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/presentation/pages/motel_info_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go',
      debugShowCheckedModeBanner: false,
      initialRoute: "/motel-info",
      routes: {'/motel-info': (context) => const MotelInfoPage()},
      theme: AppThemeData.primaryTheme(),
    );
  }
}
