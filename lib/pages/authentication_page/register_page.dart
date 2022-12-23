import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/auth_controller.dart';
import 'package:infarm/pages/homescreen_page/navigation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool? isTrue = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();


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

                  Obx(() => Column(
                      children: [
                        textField(title: "Nama Lengkap", hint: "John Doe", controller: nameController, isObscure: false), 16.heightBox,
                        textField(title: email, hint: emailHint, controller: emailController, isObscure: false), 16.heightBox,
                        textField(title: password, hint: passwordHint, controller: passwordController, isObscure: true), 16.heightBox,
                        textField(title: "Konfirmasi Password", hint: passwordHint, controller: confirmPassController, isObscure: true),
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
                        controller.isLoading.value 
                          ?const CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(appBlue),) 
                          :button(
                            color: isTrue == true ? appYellow : grey, text: "Buat Akun", textColor: white, 
                            onPress: () async {
                              if(passwordController.text != confirmPassController.text){
                                VxToast.show(context, msg: "Konfirmasi password tidak sama dengan password!", showTime: 3500, bgColor: Colors.red[400], textColor: white);
                              }else if(isTrue == true){
                                controller.isLoading(true);
                                try {
                                  await controller.registerMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text).then((value){
                                      if(value != null){
                                        VxToast.show(context, msg: "Berhasil Masuk!");
                                        Get.offAll(() => const Navigation());
                                        return controller.storeUserData(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                      controller.isLoading(false);
                                      
                                    } 
                                  );
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isLoading(false);
                                }
                              }else{
                                VxToast.show(context, msg: "Anda harus menyetujui syarat dan ketentuan aplikasi kami.", showTime: 3500, bgColor: Colors.red[400], textColor: white);
                              }
                          }
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