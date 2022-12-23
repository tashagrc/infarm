import 'package:infarm/constants/constantBuilder.dart';
import 'package:intl/intl.dart'  as intl;

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

Widget orderCardDetailsPrice({title1, title2, sub1}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title1".text.fontFamily(semiBold).make(),
            "Jumlah: $sub1".text.color(appBlue).fontFamily(semiBold).make()
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              intl.NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp ',
                decimalDigits: 2,
              ).format(title2),
              style: const TextStyle(
                fontFamily: semiBold,
                fontSize: 14
              ),
            )
          ],
        ),
      ],  
    ),
  );

}

Widget totalPrice({title, sub, context}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      "$title".text.fontFamily(semiBold).color(white).make(),
      7.widthBox,
      Expanded(
        child: Container(
          height: 1,
          color: Colors.white70.withOpacity(0.2),
        ),
      ),
      7.widthBox,
      Text(
        intl.NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp ',
          decimalDigits: 2,
        ).format(sub),
        style: const TextStyle(
          fontFamily: semiBold,
          fontSize: 14,
          color: white
        ),
      )
    ],
  );
}

Widget grandTotal({title, sub, context}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      "$title".text.fontFamily(bold).size(17).color(white).make(),
      7.widthBox,
      Expanded(
        child: Container(
          height: 1,
          color: Colors.white70.withOpacity(0.2),
        ),
      ),
      7.widthBox,
      Text(
        intl.NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp ',
          decimalDigits: 2,
        ).format(sub),
        style: const TextStyle(
          fontFamily: bold,
          fontSize: 18,
          color: appLightYellow
        ),
      )
    ],
  );
}