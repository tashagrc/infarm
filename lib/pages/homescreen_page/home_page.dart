import 'package:infarm/constants/constantBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navBody = [
      const Center(child: Text('Utama'),),
      const Center(child: Text('Kategori'),),
      const Center(child: Text('Keranjang'),),
      const Center(child: Text('Akun'),),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() =>
            Expanded(
              child: navBody.elementAt(controller.currIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() =>
        BottomNavigationBar(
          currentIndex: controller.currIndex.value,
          selectedItemColor: appYellow,
          unselectedItemColor: white,
          selectedLabelStyle: const TextStyle(fontFamily: semiBold, color: appYellow),
          type: BottomNavigationBarType.fixed,
          backgroundColor: appBlue,
          items: [
            BottomNavigationBarItem(icon: Image.asset(homeIcon, width: 26, color: white), label: "Utama"),
            BottomNavigationBarItem(icon: Image.asset(categoryIcon, width: 26, color: white), label: "Kategori"),
            BottomNavigationBarItem(icon: Image.asset(cartIcon, width: 26, color: white), label: "Keranjang"),
            BottomNavigationBarItem(icon: Image.asset(profileIcon, width: 26, color: white), label: "Akun"),
          ],

          onTap: (value){
            controller.currIndex.value = value;
          },
          
        ),
      ),
    );
  }
}

class HomeController extends GetxController{

  var currIndex = 0.obs;

}