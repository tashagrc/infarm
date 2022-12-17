import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImg = ''.obs;
  var profileImgURL = '';
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var passController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 75);
      if (img == null) return;
      profileImg.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfilePic() async {
    var fileName = basename(profileImg.value);
    var destination = 'images/${currentUser!.uid}/$fileName';

    Reference reference = FirebaseStorage.instance.ref().child(destination);

    await reference.putFile(File(profileImg.value));
    profileImgURL = await reference.getDownloadURL();
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isLoading(false);
  }
}
