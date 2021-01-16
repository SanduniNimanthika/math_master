import 'package:flutter/material.dart';
import 'package:mathmaster/mainPages/splash.dart';
import 'package:mathmaster/commanWidgets/textStyle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                  title: 'Math Master',
                  theme:  AppTheme.lightTheme,

                  home: Splash(),
                  debugShowCheckedModeBanner: false,
                );
  }
}
