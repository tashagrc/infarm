import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/authentication_page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(loginBg), fit: BoxFit.fill)
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.12).heightBox,
                  "Masuk".text.fontFamily(bold).color(appBlue).size(30).make(),
                  20.heightBox,
                  Image.asset(loginArt).box.size(171, 170).make(),

                  Column(
                    children: [
                      textField(title: email, hint: emailHint),
                      16.heightBox,
                      textField(title: password, hint: passwordHint),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: "Lupa Password?".text.make()),
                      ),
                      5.heightBox,
                      button(
                        color: appYellow, text: "Masuk", textColor: white, onPress: (){}
                      ).box.width(context.screenWidth - 40).make(),

                      5.heightBox,
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Belum punya akun? ",
                              style: TextStyle(fontFamily: regular, color: darkGrey)
                            ),
                            TextSpan(
                              text: "Daftar disini",
                              style: TextStyle(fontFamily: bold, color: appYellow)
                            )
                          ]
                        ),
                      ).onTap((){Get.to(const RegisterPage());}),
                    ],
                  ).box.padding(const EdgeInsets.all(20)).make()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
