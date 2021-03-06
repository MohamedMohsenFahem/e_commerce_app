import 'package:e_commerce/screen/login.dart';
import 'package:e_commerce/screen/signUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home:LoginPage(),

    );
  }
}