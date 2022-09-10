import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movie_world/app_module.dart';
import 'package:movie_world/core/pattern_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppModule.initialRoute);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movie World',
      theme: PatternTheme.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
