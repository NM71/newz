import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newz/pages/home.dart';
import 'package:newz/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Righteous'),
      home: LandingPage(),
    );
  }
}

