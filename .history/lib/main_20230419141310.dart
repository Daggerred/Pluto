import 'package:flutter/material.dart';
import 'package:social_prac/responsive/responsive_layout.dart';
import 'package:social_prac/utils/colors.dart';
import 'package:social_prac/responsive/mobile_Screen_Layout.dart';
import 'package:social_prac/responsive/web_Screen_Layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Social_something',
      home: const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout()),
    );
  }
}
