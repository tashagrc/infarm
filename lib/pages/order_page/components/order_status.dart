import 'package:infarm/constants/constantBuilder.dart';

Widget orderStatus({icon, color, title, isDone}){
  return ListTile(
    leading: Icon(icon, color: color,).box.border(color: color).roundedSM.padding(const EdgeInsets.all(4)).make(),
    trailing: SizedBox(
      height: 100,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "$title".text.color(darkGrey).make(),
          isDone
          ?const Icon(Icons.thumb_up_rounded, color: appBlue,)
          : Container()
        ],
      ),
    ),
  );
}