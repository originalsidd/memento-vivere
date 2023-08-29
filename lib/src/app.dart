import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/res/strings.dart';
import 'package:flutter_application_1/src/views/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appname,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
