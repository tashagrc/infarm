import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/home_controller.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  User? currentUser = auth.currentUser;
  var streetController = TextEditingController();
  var postalcodeController = TextEditingController();
  var kecamatanController = TextEditingController();
  var cityController = TextEditingController();
  var provinceController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;
  var totalProduct = 0.obs;
  late dynamic productSnapshot;
  var products = [];

  var placingOrder = false.obs;

  calculate(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value =
          totalPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  orderProduct({required orderPaymentMethod, required totalAmount}) async {

    placingOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "12345678",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_street': streetController.text,
      'order_by_kecamatan': kecamatanController.text,
      'order_by_city': cityController.text,
      'order_by_province': provinceController.text,
      'order_by_postalcode': postalcodeController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': "Pos Indonesia",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'image': productSnapshot[i]['images'],
        'quantity': productSnapshot[i]['quantity'],
        'title': productSnapshot[i]['productName'],
        'vendorID': productSnapshot[i]['vendorId'],
        'totalPrice': productSnapshot[i]['totalPrice']
      });
    }
  }

  clearCart(){
    for(var i = 0; i < productSnapshot.length; i++){
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}
