import 'package:flutter/material.dart';
import 'package:tuyok_mobile/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuyok',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LandingPage(),
    );
  }
}
