import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';

class HomeController extends GetxController {
  var currNavIndex = 0.obs;
  var username = '';
  User? currentUser = auth.currentUser;
  var searchController = TextEditingController();

  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  getUsername() async {
    var inp = await firestore
        .collection(usersCollection)
        .where('uid', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    username = inp;
  }
}
