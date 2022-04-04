import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'config_reader.dart';
import 'environment.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  String title = '';
  Color? primaryColor;
  switch (env) {
    case Environment.dev:
      print("DEV");
      primaryColor = Colors.blue;
      title ="Development";
      break;
    case Environment.prod:
      print("PROD");
      primaryColor = Colors.red;
      title = "Production";
      break;
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: MyApp(title, primaryColor),
    ),
  );
}
