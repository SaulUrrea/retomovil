import 'package:app/src/pages/login_page.dart';
import 'package:app/src/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reto App',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'splash_screen': (context) => SplashScreenPage()
      },
    );
  }
}
