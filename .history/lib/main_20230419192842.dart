import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_prac/responsive/responsive_layout.dart';
import 'package:social_prac/utils/colors.dart';
import 'package:social_prac/responsive/mobile_Screen_Layout.dart';
import 'package:social_prac/responsive/web_Screen_Layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
