import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/post_details.dart';
import 'screens/user_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // This is where you specify the initial screen
    );
  }
}
