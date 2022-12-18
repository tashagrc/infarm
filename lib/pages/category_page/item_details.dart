import 'package:infarm/constants/constantBuilder.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar:
          AppBar(title: title!.text.white.fontFamily(bold).make(), actions: [
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 320,
                      autoPlayInterval: const Duration(seconds: 8),
                      itemCount: 3,
                      aspectRatio: 4 / 4,
                      itemBuilder: (context, index) {
                        return Image.asset(product1,
                            width: double.infinity, fit: BoxFit.cover);
                      }),
                  10.heightBox,

                  //PRICE
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: "Rp24.000"
                          .text
                          .color(appBlue)
                          .fontFamily(bold)
                          .size(23)
                          .make()),

                  3.heightBox,

                  //TITLE AND DETAIL
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: title!.text
                          .size(21)
                          .color(appBlue)
                          .fontFamily(semiBold)
                          .make()),

                  //RATING
                  8.heightBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: context.screenWidth,
                    child: VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: grey,
                        selectionColor: appYellow,
                        count: 5,
                        size: 25,
                        stepInt: true),
                  ),

                  15.heightBox,

                  //DESCRIPTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: "Deskripsi Produk"
                        .text
                        .color(black)
                        .fontFamily(bold)
                        .size(20)
                        .make(),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:
                        "This is a dummy item desc aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa, teriak kack? wkwkwkwkwk biar panjang jadi ini adalah deskripsi"
                            .text
                            .color(darkGrey)
                            .make(),
                  ),

                  15.heightBox,
                  //SELLER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Toko".text.white.make(),
                          5.heightBox,
                          "Nama Toko"
                              .text
                              .fontFamily(bold)
                              .white
                              .size(16)
                              .make()
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: white,
                        child: Icon(Icons.message_rounded, color: appBlue),
                      ),
                    ],
                  )
                      .box
                      .height(80)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(appBlue)
                      .make(),

                  5.heightBox,

                  //QUANTITY
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100,
                        child: "Jumlah"
                            .text
                            .color(black)
                            .size(18)
                            .fontFamily(semiBold)
                            .make(),
                      ),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.remove)),
                      5.widthBox,
                      "0".text.size(16).color(darkGrey).fontFamily(bold).make(),
                      5.widthBox,
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.add)),
                      10.widthBox,
                      "(0 stok)".text.color(grey).make(),
                    ],
                  ),

                  //TOTAL PRICE
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 150,
                        child: "Total Harga".text.color(black).size(18).make(),
                      ),
                      "Rp0"
                          .text
                          .color(Colors.red)
                          .size(18)
                          .fontFamily(bold)
                          .make(),
                    ],
                  ),
                  const Divider(
                    color: grey,
                    thickness: 1,
                    height: 35,
                  ),

                  //PRODUK YANG MUNGKIN KAMU SUKA
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: "Produk yang mungkin kamu suka"
                        .text
                        .fontFamily(bold)
                        .size(18)
                        .color(black)
                        .make(),
                  ),
                  15.heightBox,
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                    ),
                  ),
                  15.heightBox
                ],
              ),
            ),
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
