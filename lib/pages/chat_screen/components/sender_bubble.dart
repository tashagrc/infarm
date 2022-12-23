import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:intl/intl.dart' as intl;

Widget senderBubble(DocumentSnapshot data) {
  User? currentUser = auth.currentUser;
  var timeRaw = data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(timeRaw);

  return Directionality(
    textDirection: data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
        padding: const EdgeInsets.all(11),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: data['uid'] == currentUser.uid ? appYellow : appBlue,
            borderRadius: data['uid'] == currentUser.uid 
            ?const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )
            :const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            "${data['message']}".text.white.size(16).make(),
            10.heightBox,
            time.text.white.size(16).make(),
          ],
        )),
  );
}
