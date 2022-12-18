import 'package:infarm/constants/constantBuilder.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
            title: title!.text.color(darkGrey).fontFamily(bold).make(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ]),
        body: Column(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // swipe2
                      VxSwiper.builder(
                          autoPlay: true,
                          height: 350,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Image.asset(product1,
                                width: double.infinity, fit: BoxFit.cover);
                          }),

                      10.heightBox,

                      // title + detail
                      title!.text
                          .size(16)
                          .color(darkGrey)
                          .fontFamily(semiBold)
                          .make(),
                      10.heightBox,
                      VxRating(
                          onRatingUpdate: (value) {},
                          normalColor: grey,
                          selectionColor: appYellow,
                          maxRating: 5,
                          count: 5,
                          size: 25,
                          stepInt: true),
                      10.heightBox,
                      "Rp24.000"
                          .text
                          .color(black)
                          .fontFamily(bold)
                          .size(18)
                          .make(),

                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                "Seller".text.white.fontFamily(semiBold).make(),
                                5.heightBox,
                                "Brands"
                                    .text
                                    .fontFamily(semiBold)
                                    .color(darkGrey)
                                    .size(16)
                                    .make()
                              ])),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded, color: darkGrey),
                          )
                        ],
                      ).box.height(70).color(grey).make(),
                    ],
                  ),
                )),
          )),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: button(
                  color: appYellow,
                  onPress: () {},
                  textColor: white,
                  text: "Add to cart"))
        ]));
  }
}
