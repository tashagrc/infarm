import 'package:flutter/material.dart';
export 'package:velocity_x/velocity_x.dart';
export 'package:flutter/material.dart';
export 'package:infarm/widgets/button.dart';
export 'package:infarm/widgets/textField.dart';
export 'package:get/get.dart';
export 'package:firebase_core/firebase_core.dart';
export 'firebaseConstant.dart';
export 'package:infarm/widgets/skeleton.dart';

//COLORS
const Color bgWhite = Color(0xffEFEFEF);
const Color white = Colors.white;
const Color textfield = Color(0xffEBEBEB);
const Color lightGrey = Color.fromARGB(255, 227, 227, 227);
const Color grey = Color(0xffA0A0A0);
const Color darkGrey = Color(0xff656565);
const Color appBlue = Color(0xff4D4672);
const Color appLightYellow = Color(0xffFFCF9B);
const Color appYellow = Color(0xffF9B060);
const Color black = Color.fromARGB(255, 0, 0, 0);

//STRINGS
const email = 'Email';
const emailHint = 'emailmu@example.com';
const password = 'Password';
const passwordHint = '* * * * *';

//TEXT STYLE
TextStyle title =
    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: appBlue);

//IMAGES
const landingBg = 'assets/images/landing_page_bg.png';
const loginArt = 'assets/images/login_art.png';
const loginBg = 'assets/images/login_bg.png';
const ads1 = 'assets/images/ads-1.png';
const ads2 = 'assets/images/ads-2.png';
const product1 = 'assets/images/product1.png';
const categoryPestisida = 'assets/images/category3.png';
const categoryBenih = 'assets/images/category1.png';
const categoryPupuk = 'assets/images/category4.png';
const categoryObat = 'assets/images/category2.png';
const batikBg = 'assets/images/batik_bg.png';
const featuredBg = 'assets/images/featured_bg.png';
const splashBg = 'assets/images/splash.png';
const categoryEmpty = 'assets/images/category_empty.png';
const cartEmpty = 'assets/images/cart_empty.png';
const favEmpty = 'assets/images/fav_empty.png';
const imageLoading = 'assets/images/image_loading.png';
const notLoaded = 'assets/images/not_loaded.png';
const onboarding1 = 'assets/images/onboarding1.png';
const onboarding2 = 'assets/images/onboarding2.png';
const onboarding3 = 'assets/images/onboarding3.png';
const bcaPayment = 'assets/images/bca_payment.png';
// ganti gambar
const briPayment = 'assets/images/bri_payment.png';
const cashPayment = 'assets/images/tunai_payment.png';

//ICON
const cartIcon = 'assets/icons/cart.png';
const cartBg = 'assets/icons/cart_empty.png';
const historyIcon = 'assets/icons/history.png';
const homeIcon = 'assets/icons/home.png';
const chatIcon = 'assets/icons/chat.png';
const profileIcon = 'assets/icons/profile.png';
const forgetPassIcon = 'assets/icons/forget_pass.png';
const profilePic = 'assets/icons/profilePic.png';
const favIcon = 'assets/icons/favourite.png';

// FONT
const regular = "OpenSans-Regular";
const semiBold = "OpenSans-SemiBold";
const bold = "OpenSans-Bold";

//LIST
const paymentMethodList = [bcaPayment, briPayment, cashPayment];
const paymentMethodNameList = ["BCA", "BRI", "Tunai"];

// CATEGORY
const categoryNameList = ["Pestisida", "Pupuk", "Bibit", "Lain lain"];
const categoryImages = [
  categoryPestisida,
  categoryBenih,
  categoryPupuk,
  categoryObat
];
