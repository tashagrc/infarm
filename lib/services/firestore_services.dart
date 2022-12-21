import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/chats_controller.dart';

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
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrders(){
    return firestore.collection(ordersCollection).where('order_by', isEqualTo: currentUser!.uid).snapshots();
  }

  static getWishlist(){
    return firestore.collection(productsCollection).where('pWishlist', arrayContains: currentUser!.uid).snapshots();
  }

  static getAllMessages(){
    return firestore.collection(chatsCollection).where('from_id', isEqualTo: currentUser!.uid).snapshots();
  }

}
