import 'package:infarm/constants/constantBuilder.dart';

Widget textField({String? title, String? hint, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(appBlue).fontFamily(bold).size(15).make(),
      4.heightBox,
      TextFormField(
        decoration: InputDecoration(
          fillColor: textfield,
          filled: true,
          isDense: true,
          hintText: hint!,
          hintStyle: const TextStyle(
            color: grey,
            fontFamily: regular
          ),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: appBlue
            )
          )
        ),
      ),

    ],
  );
}