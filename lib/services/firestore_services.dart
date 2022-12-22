import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';


class FirestorServices {
  
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('pCategory', isEqualTo: category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('userId', isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  // dapatkan semua data messages
  static getChatMessages(docId) {
    return firestore.collection(chatsCollection).doc(docId).collection(messagesCollection).orderBy('created_on', descending: false).snapshots();
  }

  static getAllOrders(){
    User? currentUserCurr = auth.currentUser;
    return firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUserCurr!.uid).snapshots();
  }

  static getWishlist(){
    User? currentUserCurr = auth.currentUser;
    return firestore.collection(productsCollection).where('pWishlist', arrayContains: currentUserCurr!.uid).snapshots();
  }
 
  static getAllMessages(){
    User? currentUserCurr = auth.currentUser;
    return firestore.collection(chatsCollection).where('from_id', isEqualTo: currentUserCurr!.uid).snapshots();
  }  

  static getCounts() async{
    User? currentUserCurr = auth.currentUser;
    var res = await Future.wait([
      firestore.collection(cartCollection).where('added_by', isEqualTo: currentUserCurr!.uid).get().then((value){
        return value.docs.length;
      }),

      firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUserCurr.uid).get().then((value){
        return value.docs.length;
      }),

      
    ]);
    return res;
  }

  static allProducts(){
    return firestore.collection(productsCollection).snapshots();
  }

  static getFeaturedProducts(){
    return firestore.collection(productsCollection).where('isFeatured', isEqualTo: true).get();
  }
}
