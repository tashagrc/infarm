import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/cart_controller.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: button(
            onPress: () {
              controller.orderProduct(
                  orderPaymentMethod:
                      paymentMethodNameList[controller.paymentIndex.value],
                  totalAmount: controller.totalProduct.value);
            },
            color: appBlue,
            textColor: white,
            text: "Pesan"),
      ),
      appBar: AppBar(
        title: "Pilih metode pembayaran"
            .text
            .fontFamily(semiBold)
            .color(grey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
              children: List.generate(paymentMethodList.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.changePaymentIndex(index);
              },
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: controller.paymentIndex.value == index
                          ? appBlue
                          : Colors.transparent,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Image.asset(paymentMethodList[index],
                        width: double.infinity,
                        height: 120,
                        colorBlendMode: controller.paymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.paymentIndex.value == index
                            ? Colors.black.withOpacity(0.3)
                            : Colors.transparent,
                        fit: BoxFit.cover),
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
                            .white
                            .fontFamily(semiBold)
                            .size(16)
                            .make()),
                  ])),
            );
          })),
        ),
      ),
    );
  }
}
