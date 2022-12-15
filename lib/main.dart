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
        // scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: const LoginPage(),
    );
  }
}
