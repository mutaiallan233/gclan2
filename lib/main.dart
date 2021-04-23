import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:explore/screens/game_page.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/screen_error.dart';
import 'package:explore/screens/screen_load.dart';
import 'package:explore/utils/authentication.dart';
import 'package:explore/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    initializeFlutterFire();
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Loading();
    }

    return MaterialApp(
      title: 'GamesClan',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/',
      routes: {
        '/second': (context) => GamePage(),
      },
      home: HomePage(),
    );
  }
}
