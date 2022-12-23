import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/chats_controller.dart';
import 'package:infarm/controller/product_controller.dart';
import 'package:infarm/pages/chat_screen/chat_screen.dart';
import 'package:infarm/services/firestore_services.dart';
import 'package:intl/intl.dart'  as intl;

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return WillPopScope(
      onWillPop: () async {
        controller.reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: bgWhite,
        appBar: AppBar(
            title: title!.text.white.fontFamily(bold).make(),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  controller.reset();
                  Get.back();
                }),
            actions: [
              Obx(
                () => IconButton(
                  onPressed: () {
                    if (controller.isFavorite.value == true) {
                      controller.removeFromWishList(data.id, context);
                    } else {
                      controller.addToWishList(data.id, context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: controller.isFavorite.value ? Colors.red : white,
                  ),
                ),
              ),
            ]),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //PRODUCT IMAGE
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 320,
                        autoPlayInterval: const Duration(seconds: 8),
                        itemCount: data['pImages'].length,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return FadeInImage.assetNetwork(
                            placeholder: imageLoading,
                            image: data['pImages'][index],
                            width: double.infinity, 
                            fit: BoxFit.contain,
                            
                          );
                        }),
                    10.heightBox,

                    //PRICE
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          intl.NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp ',
                            decimalDigits: 2,
                          ).format(int.parse(data['pPrice'])),
                          style: const TextStyle(
                            fontFamily: bold,
                            fontSize: 23,
                            color: appBlue
                          ),
                        ),
                    ),

                    3.heightBox,

                    //TITLE AND DETAIL
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: "${data['pName']}"
                            .text
                            .size(21)
                            .color(appBlue)
                            .fontFamily(semiBold)
                            .make()),

                    //RATING
                    8.heightBox,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: VxRating(
                            isSelectable: false,
                            value: double.parse(data['pRating']),
                            onRatingUpdate: (value) {},
                            normalColor: grey,
                            selectionColor: appYellow,
                            count: 5,
                            maxRating: 5,
                            size: 25,
                          ),
                        ),
                        Container(
                          //FOR VERTICAL DIVIDER
                          color: grey,
                          height: 21,
                          width: 1.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: "${double.parse(data['pRating'])}"
                              .text
                              .fontFamily(semiBold)
                              .size(17)
                              .make(),
                        )
                      ],
                    ),
                    const Divider(
                      color: grey,
                      thickness: 0.4,
                      height: 35,
                    ),

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
                      child: "${data['pDesc']}".text.color(darkGrey).make(),
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
                            3.heightBox,
                            "${data['pSeller']}"
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
                        ).onTap(() {
                          Get.to(
                            () => const ChatScreen(),
                            arguments: [data['pSeller'], data['vendorID']],
                          );
                        }),
                      ],
                    )
                        .box
                        .height(80)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(appBlue)
                        .make(),

                    5.heightBox,

                    //QUANTITY
                    Obx(
                      () => Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: 136,
                            child: "Jumlah"
                                .text
                                .color(black)
                                .size(18)
                                .fontFamily(semiBold)
                                .make(),
                          ),
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                controller.decrease();
                                controller.calculateTotalPrice(
                                    int.parse(data['pPrice']));
                              },
                              icon: const Icon(Icons.remove)),
                          5.widthBox,
                          controller.quantity.value.text
                              .size(16)
                              .color(darkGrey)
                              .fontFamily(bold)
                              .make(),
                          5.widthBox,
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                controller.increase(int.parse(data['pStock']));
                                controller.calculateTotalPrice(
                                    int.parse(data['pPrice']));
                              },
                              icon: const Icon(Icons.add)),
                          10.widthBox,
                          "(${data['pStock']} Stok)".text.color(grey).make(),
                        ],
                      ),
                    ),

                    //TOTAL PRICE
                    Obx(
                      () => Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: 150,
                            child:
                                "Total Harga".text.color(black).size(18).make(),
                          ),
                          "${controller.totalPrice.value}"
                              .numCurrencyWithLocale(locale: 'id')
                              .text
                              .color(Colors.red)
                              .size(18)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ),
                    ),
                    const Divider(
                      color: grey,
                      thickness: 0.4,
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
                      child: FutureBuilder(
                        future: FirestorServices.getFeaturedProducts(),
                        builder: (context, AsyncSnapshot<QuerySnapshot>featuredsnapshot) {
                          if (!featuredsnapshot.hasData) {
                            return Row(
                              children: List.generate(
                                4,
                                (index) => Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))
                                      ),
                                    ),
                                    
                                    10.heightBox,
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Skeleton(15, 125),
                                    ),
                                    
                                    7.heightBox,
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Skeleton(15, 100),
                                    ),
                                    7.heightBox
                                  ],
                                ).box.white.roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).make()
                              ),
                            );
                          }else {
                            var featuredData =featuredsnapshot.data!.docs;
                            return Row(
                              children: List.generate(
                                featuredData.length,
                                (index) => Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(borderRadius:
                                      const BorderRadius.only(topLeft:Radius.circular(7),topRight:Radius.circular(7)),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: imageLoading,
                                        image: featuredData[index]['pImages'][0],
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    10.heightBox,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child:featuredData[index]['pName'].toString().length > 16 
                                          ?"${featuredData[index]['pName'].toString().substring(0, 16)}...".text.fontFamily(semiBold).color(darkGrey).make()
                                          :"${featuredData[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make()
                                    ),
                                    7.heightBox,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child:Text(
                                        intl.NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 2,
                                        ).format(int.parse(featuredData[index]['pPrice'])),
                                        style: const TextStyle(
                                          fontFamily: bold,
                                          fontSize: 16,
                                          color: appYellow
                                        ),
                                      ),
                                    ),
                                    7.heightBox
                                  ],
                                ).box.white.roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                                    Get.to(() => ItemDetails(title:"${featuredData[index]['pName']}",data: featuredData[index],));
                                  }
                                )
                              ),
                            );
                          }
                        }
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
                    onPress: () {
                      if (controller.quantity.value > 0) {
                        controller.addToCart(
                            title: data['pName'],
                            img: data['pImages'][0],
                            sellerName: data['pSeller'],
                            vendorID: data['vendorID'],
                            quantity: controller.quantity.value,
                            totalPrice: controller.totalPrice.value,
                            context: context);
                        VxToast.show(context,
                            msg: "Berhasil menambah ke keranjang");
                      } else {
                        VxToast.show(context,
                            msg: "Kamu belum menambahkan jumlah produk");
                      }
                    },
                    textColor: white,
                    text: "Add to cart"))
          ],
        ),
      ),
    );
  }
}
