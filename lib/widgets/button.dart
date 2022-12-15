import 'package:infarm/constants/constantBuilder.dart';

Widget button({onPress, color, textColor, String? text}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12)
    ),
    onPressed: () {
      onPress;
    },
    child: text!.text.color(textColor).fontFamily(bold).make()
  );
}
