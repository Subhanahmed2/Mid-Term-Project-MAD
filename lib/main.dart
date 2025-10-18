import 'package:flutter/material.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Menu App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // Home Page is the first screen that opens
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/menu': (context) => MenuPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
