import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infarm/constants/constantBuilder.dart';

class ProfileController extends GetxController{

  var profileImg = ''.obs;

  changeImage(context) async{
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 75);
      if(img == null) return;
      profileImg.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}