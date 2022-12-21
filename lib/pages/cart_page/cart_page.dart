import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/cart_controller.dart';
import 'package:infarm/pages/cart_page/shipping_page.dart';
import 'package:infarm/services/firestore_services.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    User? currentUser = auth.currentUser;
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: "Keranjang Belanja".text.color(white).fontFamily(bold).make(),
        ),
        body: StreamBuilder(
            stream: FirestorServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(appBlue),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        cartEmpty,
                        width: 180,
                      ),
                      20.heightBox,
                      "Keranjangmu masih kosong.\n Ayo tambah produk sekarang!"
                          .text
                          .size(17)
                          .align(TextAlign.center)
                          .color(grey)
                          .make()
                    ],
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.calculate(data);

                controller.productSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading:
                                      Image.network('${data[index]['images']}'),
                                  title:
                                      "${data[index]['productName']}\nJumlah: ${data[index]['quantity']}"
                                          .richText
                                          .fontFamily(semiBold)
                                          .size(16)
                                          .make(),
                                  subtitle: "${data[index]['totalPrice']}"
                                      .numCurrencyWithLocale(locale: 'id')
                                      .text
                                      .color(appBlue)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                  trailing: const Icon(
                                    Icons.close_rounded,
                                    color: darkGrey,
                                  ).onTap(() {
                                    FirestorServices.deleteDocument(
                                        data[index].id);
                                  }),
                                );
                              })),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Harga"
                              .text
                              .fontFamily(semiBold)
                              .color(darkGrey)
                              .make(),
                          Obx(() => "${controller.totalPrice.value}"
                              .numCurrencyWithLocale(locale: 'id')
                              .text
                              .fontFamily(bold)
                              .color(appBlue)
                              .make())
                        ],
                      )
                          .box
                          .padding(const EdgeInsets.all(10))
                          .color(appLightYellow)
                          .width(context.screenWidth - 40)
                          .roundedSM
                          .make(),
                      12.heightBox,
                      SizedBox(
                          width: context.screenWidth - 40,
                          child: button(
                              color: appBlue,
                              onPress: () {
                                Get.to(() => const ShippingDetails());
                              },
                              textColor: white,
                              text: "Beli Sekarang")),
                    ],
                  ),
                );
              }
            }));
  }
}
