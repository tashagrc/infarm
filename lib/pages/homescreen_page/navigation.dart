import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/home_controller.dart';
import 'package:infarm/pages/cart_page/cart_page.dart';
import 'package:infarm/pages/homescreen_page/home_page.dart';
import 'package:infarm/pages/profile_page/profile_page.dart';
import 'package:infarm/widgets/exit_dialog.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBody = [const HomePage(), const CartPage(), const ProfilePage()];

    return WillPopScope(
      onWillPop: () async {
        showDialog(context: context, builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(controller.currNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currNavIndex.value,
            selectedItemColor: appYellow,
            unselectedItemColor: white,
            selectedLabelStyle:
                const TextStyle(fontFamily: semiBold, color: appYellow),
            type: BottomNavigationBarType.fixed,
            backgroundColor: appBlue,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(homeIcon, width: 26, color: white),
                  label: "Utama"),
              BottomNavigationBarItem(
                  icon: Image.asset(cartIcon, width: 26, color: white),
                  label: "Keranjang"),
              BottomNavigationBarItem(
                  icon: Image.asset(profileIcon, width: 26, color: white),
                  label: "Akun"),
            ],
            onTap: (value) {
              controller.currNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
