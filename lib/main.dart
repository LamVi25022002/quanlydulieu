import 'package:flutter/material.dart';
import 'package:home/document_viewer_page.dart';
import 'package:home/home/home.dart';
import 'package:home/sign_in/login.dart';
import 'package:home/sign_in/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        fontFamily: 'AvertaStdCy',
      ),
      home: const Home(),
    );
  }
}
