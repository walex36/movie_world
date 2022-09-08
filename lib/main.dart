import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_endpoint/lib_endpoint.dart';
import 'package:movie_world/app_module.dart';
import 'package:movie_world/app_widget.dart';

void main() {
  endPointConfig = Endpoint.development();

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
