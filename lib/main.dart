import 'package:assignment_flutter/screens/mixer_screen.dart';
import 'package:assignment_flutter/screens/upgrade_homepage.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/subscription_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figma Challenge',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: HomepageScreen(),
    );
  }
}
