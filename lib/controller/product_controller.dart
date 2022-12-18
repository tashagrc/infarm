import 'package:flutter/services.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/models/category_model.dart';

class ProductController extends GetxController{

  var quantity = 0.obs;
  var totalPrice = 0.obs;

  var subcat = [];

  getSubCategories(title) async{
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((e) => e.name == title).toList();
    
    for(var e in s[0].subcategory){
      subcat.add(e);
    }

  }

  increase(totalStock){
    if(quantity.value < totalStock){
      quantity.value++;
    }
    
  }

  decrease(){
    if(quantity.value > 0){
      quantity.value--;
    }
    
  }

  calculateTotalPrice(price){
    totalPrice.value = price*quantity.value;
  }


}