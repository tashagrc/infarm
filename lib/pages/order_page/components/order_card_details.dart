import 'package:infarm/constants/constantBuilder.dart';

Widget orderCardDetails({title1, title2, sub1, sub2}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title1".text.fontFamily(semiBold).make(),
            "$sub1".text.color(appBlue).fontFamily(semiBold).make()
          ],
        ),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title2".text.fontFamily(semiBold).make(),
              "$sub2".text.make()
            ],
          ),
        ),
      ],  
    ),
  );

}