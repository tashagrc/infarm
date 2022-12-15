import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/authentication_page/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  "Buat Akun".text.fontFamily(bold).color(appBlue).size(30).make(),
                  5.heightBox,

                  Column(
                    children: [
                      textField(title: "Nama Lengkap", hint: "John Doe"), 16.heightBox,
                      textField(title: email, hint: emailHint), 16.heightBox,
                      textField(title: password, hint: passwordHint), 16.heightBox,
                      textField(title: "Konfirmasi Password", hint: passwordHint),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: "Lupa Password?".text.make()),
                      ),
                      5.heightBox,
                      Row(
                        children: [
                          Checkbox(
                            checkColor: appYellow,
                            value: false, onChanged: (newValue){}
                          ),

                          10.widthBox,
                          Expanded(
                            child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Saya menyetujui ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: darkGrey
                                  )
                                ),
                                TextSpan(
                                  text: "syarat dan ketentuan",
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: appYellow
                                  )
                                ),
                                TextSpan(
                                  text: " yang berlaku",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: darkGrey
                                  )
                                ),
                              ]
                            )),
                          )
                        ],
                      ),
                      5.heightBox,
                      button(
                        color: appYellow, text: "Buat Akun", textColor: white, onPress: (){}
                      ).box.width(context.screenWidth - 40).make(),
                      5.heightBox,
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Sudah punya akun? ",
                              style: TextStyle(fontFamily: regular, color: darkGrey)
                            ),
                            TextSpan(
                              text: "Masuk disini",
                              style: TextStyle(fontFamily: bold, color: appYellow)
                            )
                          ]
                        ),
                      ).onTap((){Get.back();}),
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