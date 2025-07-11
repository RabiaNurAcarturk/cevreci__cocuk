import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/badges_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(CevreciCocukApp());
}

class CevreciCocukApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Çevreci Çocuk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        JournalScreen.routeName: (context) => JournalScreen(),
        BadgesScreen.routeName: (context) => BadgesScreen(),
      },
    );
  }
}
