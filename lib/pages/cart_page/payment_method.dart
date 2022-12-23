import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/cart_controller.dart';
import 'package:infarm/pages/homescreen_page/navigation.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Obx(
      ()=>Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: "Metode Pembayaran".text.fontFamily(semiBold).make(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Obx(
                ()=> Column(
                  children: List.generate(paymentMethodList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.changePaymentIndex(index);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 3,
                            color: controller.paymentIndex.value == index ? Colors.green : appBlue,
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Stack(alignment: Alignment.topRight, 
                          children: [
                            Image.asset(paymentMethodList[index],
                              width: double.infinity,
                              height: 120,
                              colorBlendMode: controller.paymentIndex.value == index
                                ? BlendMode.darken
                                : BlendMode.color,
                              color: controller.paymentIndex.value == index
                                ? Colors.black.withOpacity(0.3)
                                : Colors.transparent,
                              fit: BoxFit.cover
                            ),
                            controller.paymentIndex.value == index
                              ? Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)),
                                    value: true,
                                    onChanged: (value) {}),
                                )
                              : Container(),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: paymentMethodNameList[index]
                                .text
                                .black
                                .fontFamily(bold)
                                .size(20)
                                .make()
                            ),
                          ]
                        )
                      ),
                    );
                  })
                ),
              ),
            ),
            20.heightBox,
            controller.placingOrder.value 
            ? const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),),)
            : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: context.screenWidth,
              child: button(
                onPress: () async {
                  await controller.orderProduct(
                    orderPaymentMethod:paymentMethodNameList[controller.paymentIndex.value],
                    totalAmount: controller.totalPrice.value);
                    await controller.clearCart();
                    VxToast.show(context, msg: "Pesanan berhasil dibuat!", bgColor: Colors.greenAccent);
                    Get.offAll(const Navigation()
                  );
                },
                color: appBlue,
                textColor: white,
                text: "Pesan"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
