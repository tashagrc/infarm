import 'package:infarm/constants/constantBuilder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool? isTrue = false;

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
                            activeColor: appYellow,
                            checkColor: white,
                            value: isTrue, 
                            onChanged: (newValue){
                              setState(() {
                                isTrue = newValue;
                              });
                              
                            }
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
                        color: isTrue == true ? appYellow : grey, text: "Buat Akun", textColor: white, onPress: (){}
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