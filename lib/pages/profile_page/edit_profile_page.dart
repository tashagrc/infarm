import 'dart:io';
import 'package:infarm/controller/profile_controller.dart';
import '../../constants/constantBuilder.dart';

class EditProfilePage extends StatelessWidget {

  final dynamic data;

  const EditProfilePage({super.key, this.data});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_new)),
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

                //JIKA URL IMAGE DAN CONTROLLER PATHNYA EMPTY
                data['imageUrl'] == '' && controller.profileImg.isEmpty 
                  ? Image.asset(profilePic, width: 85, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  
                  //JIKA DATA NOT EMPTY TAPI CONTROLLERNYA EMPTY
                  : data['imageUrl'] != '' && controller.profileImg.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 85,
                        height: 85,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    
                    //MASUK JIKA KEDUANYA EMPTY
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
                    textField(hint: "Nama",title: "Nama Lengkap",isObscure: false, controller: controller.nameController),
                    10.heightBox,
                    textField(hint: "Password",title: "Password",isObscure: true, controller: controller.passController),
                    20.heightBox,
                    controller.isLoading.value 
                    ?const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),))
                    :SizedBox(
                      width: context.screenWidth,
                      child: button(
                        color: appBlue, 
                        onPress: () async {
                          controller.isLoading(true);
                          await controller.uploadProfilePic();
                          await controller.updateProfile(
                            imgUrl: controller.profileImgURL,
                            name: controller.nameController.text,
                            password: controller.passController.text
                          );
                          VxToast.show(context, msg: "Perubahan berhasil disimpan");
                        },
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