import 'package:infarm/constants/constantBuilder.dart';

class CartController extends GetxController{
  var totalPrice = 0.obs;

  calculate(data){
    totalPrice.value = 0;
    for(var i = 0; i < data.length; i++){
      totalPrice.value = totalPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

}