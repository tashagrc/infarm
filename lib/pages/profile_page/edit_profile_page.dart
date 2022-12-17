import 'dart:io';
import 'package:infarm/controller/profile_controller.dart';
import '../../constants/constantBuilder.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() =>
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(batikBg), fit: BoxFit.fill)
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImg.isEmpty 
                  ? Image.asset(profilePic, width: 85, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImg.value),
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                button(
                  color: appBlue, 
                  onPress: (){
                    controller.changeImage(context);
                  },
                  textColor: white,
                  text: "Ubah Foto",
                ),
                const Divider(),
                35.heightBox,
      
                Column(
                  children: [
                    textField(hint: "Nama",title: "Nama Lengkap",isObscure: false),
                    10.heightBox,
                    textField(hint: "Password",title: "Password",isObscure: true),
                    20.heightBox,
                    SizedBox(
                      width: context.screenWidth,
                      child: button(
                        color: appBlue, 
                        onPress: (){},
                        textColor: white,
                        text: "Simpan",
                      ),
                    ),
                  ],
                ).box.white.roundedSM.shadowSm.padding(const EdgeInsets.all(15)).make(),
                
              ],
            ).box.padding(const EdgeInsets.all(15)).margin(const EdgeInsets.only(top: 60, left: 10, right: 10)).make(),
          ],
        ),
      ),
    );
  }
}