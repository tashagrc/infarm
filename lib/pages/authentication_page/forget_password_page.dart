import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/auth_controller.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  var controller = Get.put(AuthController());
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(batikBg), fit: BoxFit.fill)
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: white, size: 30,)),
                Image.asset(forgetPassIcon, width: 70,).centered(),
                10.heightBox,
                "Lupa Password?".text.white.size(25).fontFamily(bold).makeCentered(),
                15.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Masukkan Email yang telah terdaftar".text.white.color(appBlue).size(15).make(),
                    15.heightBox,
                    textField(controller: emailController, hint: "emailmu@example.com", isObscure: false, title: "Email terdaftar"),
                    15.heightBox,
                    button(
                      color: appYellow, textColor: white, text: "Kirim Kode",
                      onPress: () async{
                        await controller.resetPassword(context: context, email: emailController);
                      }
                    ).box.width(context.screenWidth).make()
                  ],
                ).box.white.padding(const EdgeInsets.all(15)).margin(const EdgeInsets.symmetric(horizontal: 15)).rounded.makeCentered()
              ],
            ),
          ),
        ],
      )
    );
  }
}