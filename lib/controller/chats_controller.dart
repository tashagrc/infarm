import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/home_controller.dart';

User? currentUser = auth.currentUser;
class ChatsController extends GetxController {
  @override
  void onInit() {
    getChatId();
    super.onInit();
  }
  
  var chats = firestore.collection(chatsCollection);

  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];

  var senderName = Get.find<HomeController>().username;
  var currentId = currentUser!.uid;

  var messageController = TextEditingController();

  var isLoading = false.obs;
  dynamic chatDocId;

  getChatId() async {
    isLoading(true);
    await chats
        .where('users', isEqualTo: {friendId: null, currentId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocId = snapshot.docs.single.id;
          } else {
            chats.add({
              'created_on': null,
              'last_message': '',
              'users': {friendId: null, currentId: null},
              'toId': friendId,
              'from_id': '',
              'friend_name': friendName,
              'sender_name': senderName
            }).then((value) {
              {
                chatDocId = value.id;
              }
            });
          }
        });
    isLoading(false);
  }

  sendMessage(message) async {
    if (message.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_message': message,
        'told': friendId,
        'fromId': currentId,
      });

      chats.doc(chatDocId).collection(messagesCollection).doc().set({
        'created_on': FieldValue.serverTimestamp(),
        'message': message,
        'uid': currentId,
      });
    }
  }
}
