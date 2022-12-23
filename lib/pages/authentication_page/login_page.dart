import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/auth_controller.dart';
import 'package:infarm/pages/authentication_page/register_page.dart';
import 'package:infarm/pages/homescreen_page/navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

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

                  Obx(() =>
                    Column(
                      children: [
                        textField(title: email, hint: emailHint, isObscure: false, controller: controller.emailController),
                        16.heightBox,
                        textField(title: password, hint: passwordHint, isObscure: true, controller: controller.passwordController),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: "Lupa Password?".text.make()
                          ),
                        ),
                        5.heightBox,
                        controller.isLoading.value 
                          ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),
                          ) 
                          :button(
                            color: appYellow, text: "Masuk", textColor: white, 
                            onPress: () async{
                              controller.isLoading(true);
                              
                              await controller.loginMethod(context: context).then((value){
                                if(value != null) {
                                  VxToast.show(context, msg: "Berhasil Masuk");
                                  controller.isLoading(false);
                                  Get.offAll(() => const Navigation());
                                }else{
                                  controller.isLoading(false);
                                }
                              });
                            }
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
                        ).onTap((){Get.to(()=> const RegisterPage());}),
                      ],
                    ).box.padding(const EdgeInsets.all(20)).make(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
