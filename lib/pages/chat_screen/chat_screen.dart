import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/chat_screen/components/sender_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: "Title".text.fontFamily(semiBold).color(darkGrey).make(),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                        color: lightGrey,
                        child: ListView(children: [
                          senderBubble(),
                          senderBubble(),
                        ]))),
                10.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Type a message...",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: grey,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: grey,
                          ))),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send, color: appBlue)),
                  ],
                )
                    .box
                    .height(60)
                    .padding(const EdgeInsets.all(12))
                    .margin(const EdgeInsets.only(bottom: 8))
                    .make(),
              ],
            )));
  }
}
