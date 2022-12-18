import 'package:infarm/constants/constantBuilder.dart';

Widget senderBubble() {
  return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        children: [
          "Message here...ini panjang bangets bangets bangets bangets banget allalsksfjvf jsdfvhf ahdjfv"
              .text
              .white
              .size(16)
              .make(),
          10.heightBox,
          "11:45 PM".text.white.size(16).make(),
        ],
      ));
}
