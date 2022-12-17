import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //LOGIN 
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //REGISTER
  Future<UserCredential?> registerMethod({email, password, context}) async{
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //LOG OUT
  Future signOutMethod(context) async{
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //TO STORE DATA
  storeUserData({name, password, email}) async{
    User? currentUser = auth.currentUser;
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'uid': currentUser!.uid,
      'cartCount': "00",
      'orderCount': "00"
    });
  }

}