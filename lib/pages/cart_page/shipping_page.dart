import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/cart_controller.dart';
import 'package:infarm/pages/cart_page/payment_method.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: "Alamat Penerima"
              .text
              .fontFamily(semiBold)
              .make(),
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              textField(
                  hint: "Jalan",
                  isObscure: false,
                  title: "Jalan",
                  controller: controller.streetController),
              textField(
                  hint: "Kecamatan",
                  isObscure: false,
                  title: "Kecamatan",
                  controller: controller.kecamatanController),
              textField(
                  hint: "Kota",
                  isObscure: false,
                  title: "Kota",
                  controller: controller.cityController),
              textField(
                  hint: "Provinsi",
                  isObscure: false,
                  title: "Provinsi",
                  controller: controller.provinceController),
              textField(
                  hint: "Nomor Telepon",
                  isObscure: false,
                  title: "Nomor Telepon",
                  controller: controller.phoneController),
              textField(
                  hint: "Kode Pos",
                  isObscure: false,
                  title: "Kode Pos",
                  controller: controller.postalcodeController),
              35.heightBox,
              SizedBox(
                height: 45,
                width: context.screenWidth,
                child: button(
                    onPress: () {
                      // validasi form, bisa diganti2
                      if (controller.streetController.text.length > 3) {
                        Get.to(() => const PaymentMethods());
                      } else {
                        VxToast.show(context, msg: "Alamat harus lebih dari 3 karakter!", showTime: 4000, bgColor: Colors.red[400], textColor: white);
                      }
                    },
                    color: appBlue,
                    textColor: white,
                    text: "Berikutnya"),
              ),
            ],
          ),
        ));
  }
}
