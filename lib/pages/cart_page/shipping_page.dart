import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/cart_controller.dart';
import 'package:infarm/pages/cart_page/payment_method.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: "Info Pengiriman"
              .text
              .fontFamily(semiBold)
              .color(darkGrey)
              .make(),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: button(
              onPress: () {
                // validasi form, bisa diganti2
                if (controller.streetController.text.length > 5) {
                  Get.to(() => const PaymentMethods());
                } else {
                  VxToast.show(context, msg: "Mohon isi alamat Anda");
                }
              },
              color: appBlue,
              textColor: white,
              text: "Berikutnya"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // customTextField(); 16.10 vid 8
              // 18.34
            ],
          ),
        ));
  }
}
