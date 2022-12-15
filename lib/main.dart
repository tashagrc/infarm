import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/authentication_page/login_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Infarm',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: bgWhite,
        fontFamily: regular,
      ),
      home: const LoginPage(),
    );
  }
}
