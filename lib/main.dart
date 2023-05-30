import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_prac/providers/user_provider.dart';
import 'package:social_prac/responsive/mobile_Screen_Layout.dart';
import 'package:social_prac/responsive/responsive_layout.dart';
import 'package:social_prac/responsive/web_Screen_Layout.dart';
import 'package:social_prac/screens/login_screen.dart';
import 'package:social_prac/screens/signup_screen.dart';
import 'package:social_prac/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyA7DW7aEPIy-UvHzdANODa1uV1AK-Vuqic',
          appId: "1:471397823349:web:1cfaa626bd7b18f9ff593c",
          messagingSenderId: "471397823349",
          projectId: "mini-project-78c35",
          storageBucket: "mini-project-78c35.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Social_something',
          // home: const ResponsiveLayout(
          //     webScreenLayout: WebScreenLayout(),
          //     mobileScreenLayout: MobileScreenLayout()),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ResponsiveLayout(
                      webScreenLayout: WebScreenLayout(),
                      mobileScreenLayout: MobileScreenLayout());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: mobileBackgroundColor,
                  ),
                );
              }
              return const Login_Screen();
            },
          )),
    );
  }
}
