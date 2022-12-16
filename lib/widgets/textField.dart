import 'package:infarm/constants/constantBuilder.dart';

Widget textField({String? title, String? hint, controller, isObscure}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(appBlue).fontFamily(bold).size(15).make(),
      4.heightBox,
      TextFormField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, ),
          fillColor: textfield,
          filled: true,
          hintText: hint!,
          hintStyle: const TextStyle(
            color: grey,
            fontFamily: regular
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent)
          ),
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