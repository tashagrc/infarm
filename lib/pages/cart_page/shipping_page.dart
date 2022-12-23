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
        title: "Alamat Penerima"
            .text
            .fontFamily(semiBold)
            .make(),
      ),
        
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            15.heightBox,
            textField(
                hint: "Alamat",
                isObscure: false,
                title: "Alamat",
                controller: controller.streetController),
            10.heightBox,
            textField(
                hint: "Kecamatan",
                isObscure: false,
                title: "Kecamatan",
                controller: controller.kecamatanController),
            10.heightBox,
            textField(
                hint: "Kota",
                isObscure: false,
                title: "Kota",
                controller: controller.cityController),
            10.heightBox,
            textField(
                hint: "Provinsi",
                isObscure: false,
                title: "Provinsi",
                controller: controller.provinceController),
            10.heightBox,
            textField(
                hint: "Nomor Telepon",
                isObscure: false,
                title: "Nomor Telepon",
                controller: controller.phoneController),
            10.heightBox,
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
                  String pattern = r'^[0-9]+';
                  RegExp regex = RegExp(pattern);
                  // VALIDASI FORM
                  if (!(controller.streetController.text.length > 5)) {
                    VxToast.show(context, msg: "Alamat harus lebih dari 5 karakter!", showTime: 4000, bgColor: Colors.red[400], textColor: white);
                  }else if(!regex.hasMatch(controller.phoneController.text) || !(controller.phoneController.text.length > 8)){
                    VxToast.show(context, msg: "Masukkan nomor telepon yang valid!", showTime: 4000, bgColor: Colors.red[400], textColor: white);
                  }else if(!regex.hasMatch(controller.postalcodeController.text)){
                    VxToast.show(context, msg: "Masukkan kode pos yang valid!", showTime: 4000, bgColor: Colors.red[400], textColor: white);
                  }
                  else {
                    Get.to(() => const PaymentMethods());
                  }
                },
                color: appBlue,
                textColor: white,
                text: "Berikutnya"
              ),
            ),
          ],
        ),
      )
    );
  }
}
