import 'package:infarm/constants/constantBuilder.dart';

class FirestorServices{

  static getUser(uid){
    return firestore.collection(usersCollection).where('uid', isEqualTo: uid).snapshots();
  }

  static getProducts(category){
    return firestore.collection(productsCollection).where('pCategory', isEqualTo: category).snapshots();
  }

}