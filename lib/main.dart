import 'package:flutter/material.dart';
import 'package:tour_app/screens/destination_screen.dart';
import 'package:tour_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF3F5F7),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        DestinationScreen.routeName: (ctx) => DestinationScreen(),
      },
    );
  }
}
