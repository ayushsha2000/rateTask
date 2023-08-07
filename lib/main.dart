import 'package:flutter/material.dart';
import 'package:task/homePage/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate App',
      home: RatePage(),
    );
  }
}







