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
      body: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // swipe2 section
                      VxSwiper.builder(
                          autoPlay: true,
                          height: 350,
                          itemCount: 3,
                          aspectRatio: 16 / 9,
                          itemBuilder: (context, index) {
                            return Image.asset(product1,
                                width: double.infinity, fit: BoxFit.cover);
                          }),

                      // title n detail
                      title!.text
                          .size(16)
                          .color(darkGrey)
                          .fontFamily(semiBold)
                          .make(),

                      // rating
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
                      // seller
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.make(),
                              5.heightBox,
                              "Brands"
                                  .text
                                  .fontFamily(semiBold)
                                  .color(darkGrey)
                                  .size(16)
                                  .make()
                            ],
                          )),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message_rounded, color: darkGrey),
                          ),
                        ],
                      )
                          .box
                          .height(60)
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .color(grey)
                          .make(),

                      // quantity section
                      20.heightBox,
                      Column(
                        // quantity
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Quantity".text.color(grey).make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove)),
                                  "0"
                                      .text
                                      .size(16)
                                      .color(darkGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                  10.widthBox,
                                  "(0 available)".text.color(grey).make(),
                                ],
                              ),
                            ],
                          ),

                          // price
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: "Total price".text.color(grey).make(),
                              ),
                              "Rp0"
                                  .text
                                  .color(Colors.red)
                                  .size(16)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          ),
                        ],
                      ),

                      // description section
                      10.heightBox,

                      "Description"
                          .text
                          .color(darkGrey)
                          .fontFamily(semiBold)
                          .make(),

                      "This is a dummy item desc aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                          .text
                          .color(darkGrey)
                          .make(),

                      // product you may also like
                      "Product you may also like"
                          .text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkGrey)
                          .make(),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            topRight: Radius.circular(7)),
                                        child: Image.asset(
                                          product1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      10.heightBox,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: "Pestisida Pesnab"
                                            .text
                                            .fontFamily(semiBold)
                                            .color(darkGrey)
                                            .make(),
                                      ),
                                      7.heightBox,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: "Rp24.000"
                                            .text
                                            .fontFamily(bold)
                                            .color(appYellow)
                                            .size(16)
                                            .make(),
                                      ),
                                      7.heightBox
                                    ],
                                  )
                                      .box
                                      .white
                                      .roundedSM
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make()),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: button(
                  color: appYellow,
                  onPress: () {},
                  textColor: white,
                  text: "Add to cart"))
        ],
      ),
    );
  }
}
