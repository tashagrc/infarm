import 'package:infarm/constants/constantBuilder.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: button(
            onPress: () {}, color: appBlue, textColor: white, text: "Pesan"),
      ),
      appBar: AppBar(
        title: "Pilih metode pembayaran"
            .text
            .fontFamily(semiBold)
            .color(grey)
            .make(),
      ),
    );
  }
}
