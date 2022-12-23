import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/models/category_model.dart';

class ProductController extends GetxController {
  User? currentUser = auth.currentUser;
  var quantity = 0.obs;
  var totalPrice = 0.obs;

  var subcat = [];
  var isFavorite = false.obs;

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((e) => e.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  increase(totalStock) {
    if (quantity.value < totalStock) {
      quantity.value++;
    }
  }

  decrease() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  reset() {
    totalPrice.value = 0;
    quantity.value = 0;
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellerName, quantity, totalPrice, context, vendorID}) async {
    await firestore.collection(cartCollection).doc().set({
      'productName': title,
      'images': img,
      'sellerName': sellerName,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'vendorId': vendorID,
      'userId': currentUser!.uid
    }).catchError((e) {
      VxToast.show(context, msg: e.toString());
    });
  }

  addToWishList(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'pWishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFavorite(true);
    VxToast.show(context, msg: "Produk ditambahkan ke favorit");
  }

  removeFromWishList(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'pWishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFavorite(false);
    VxToast.show(context, msg: "Produk dihapus dari favorit");
  }

  checkFavorite(data) async {
    if (data['pWishlist'].contains(currentUser!.uid)) {
      isFavorite(true);
    } else {
      isFavorite(false);
    }
  }
}
