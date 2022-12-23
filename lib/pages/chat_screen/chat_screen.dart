import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/chats_controller.dart';
import 'package:infarm/pages/chat_screen/components/sender_bubble.dart';
import 'package:infarm/services/firestore_services.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    User? currentUserCurr = auth.currentUser;
    var controller = Get.put(ChatsController());
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: "${controller.friendName}".text.fontFamily(semiBold).make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Obx(
                ()=> controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),))
                    : Expanded(
                      child: StreamBuilder(
                        stream: FirestorServices.getChatMessages(controller.chatDocId.toString()),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),));
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: "Belum ada pesan".text.color(darkGrey).make(),
                            );
                          } else {
                            return ListView(
                              
                              children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                                var data = snapshot.data!.docs[index];
                                return Align(alignment: data['uid'] == currentUserCurr!.uid
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,

                                  child: senderBubble(data)
                                );
                            }).toList());
                          }
                        },
                      )),
              ),
              10.heightBox,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.messageController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,),
                        hintText: "Ketik pesan...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: grey,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey,)
                        )
                      ),
                    )
                  ),
                  IconButton(
                    onPressed: () {
                      controller.sendMessage(controller.messageController.text);
                      controller.messageController.clear();
                    },
                    icon: const Icon(Icons.send, color: appBlue)
                  ),
                ],
              ).box.height(60).padding(const EdgeInsets.all(0)).margin(const EdgeInsets.only(bottom: 2)).make(),
            ],
          )
      )
    );
  }
}
