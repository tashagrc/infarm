import 'package:flutter/material.dart';
import 'package:infarm/constants/constantBuilder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: 
            [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(loginBg), fit: BoxFit.fill)
                ),
              ),
              Center(
                child: Column(
                  children: [
                    (context.screenHeight * 0.12).heightBox,
                    "Masuk".text.fontFamily(bold).color(appBlue).size(30).make(),
                    33.heightBox,
                    Image.asset(loginArt).box.white.size(171, 216).make(),
                  ],
                ),
            ),
          ],
        ),
      );
  }
}