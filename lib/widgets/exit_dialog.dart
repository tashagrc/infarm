import 'package:flutter/services.dart';
import 'package:infarm/constants/constantBuilder.dart';


Widget exitDialog(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Keluar Aplikasi".text.fontFamily(bold).color(darkGrey).make(),
        const Divider(),
        10.heightBox,
        "Apakah kamu ingin keluar aplikasi?".text.size(16).color(darkGrey).make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(color: appBlue, textColor: white, text: "Ya", onPress: (){
              SystemNavigator.pop();
            }),
            button(color: appBlue, textColor: white, text: "Tidak", onPress: (){
              Navigator.pop(context);
            }),
          ],
        )
      ],
    ).box.color(white).roundedSM.padding(const EdgeInsets.all(10)).make(),
  );
}
