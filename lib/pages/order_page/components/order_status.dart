import 'package:infarm/constants/constantBuilder.dart';

Widget orderStatus({icon, color, title, isDone, context}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: color,).box.border(color: color).width(40).height(40).roundedSM.padding(const EdgeInsets.all(4)).make(),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width *0.35,
              color: isDone? Colors.green.withOpacity(0.5) : lightGrey,
            ),
            SizedBox(
              height: 60,
              width: 135,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "$title".text.color(darkGrey).make(),
                  
                  isDone
                    ?const Icon(Icons.done_outline_rounded, color: Colors.green,)
                    : Container()
                ],
              ),
            ),
          ],
        ),

      ],
    ),
  );
}

