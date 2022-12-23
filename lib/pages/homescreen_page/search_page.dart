import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/category_page/item_details.dart';
import 'package:infarm/services/firestore_services.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: title!.text.make(),
      ),
      body: FutureBuilder(
          future: FirestorServices.searchProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(appBlue),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "Tidak ada produk ditemukan".text.makeCentered();
            } else {
              var data = snapshot.data!.docs;
              var filteredData = data.where((element) => element['pName'].toString().toLowerCase().contains(title!.toLowerCase())).toList();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 1,
                    mainAxisExtent: 270
                  ),
                  children: filteredData.mapIndexed((currentValue, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)
                        ),
                        child: Image.network(
                          filteredData[index]['pImages'][0],
                          width: 200,
                          height: 170,
                          fit: BoxFit.cover
                        )
                      ),
                      const Spacer(),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 8),
                        child: "${filteredData[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make(),
                      ),
                      10.heightBox,
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 8),
                        child: "${filteredData[index]['pPrice']}"
                          .numCurrencyWithLocale(locale: 'id')
                          .text
                          .fontFamily(bold)
                          .color(appYellow)
                          .size(16)
                          .make(),
                      ),
                      10.heightBox,
                    ],
                  ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 10)).roundedSM.outerShadowSm.make().onTap(() {
                    Get.to(() => ItemDetails(title: "${filteredData[index]['pName']}",data: filteredData[index],));
                  })
                  ).toList()
                ),
              );
            }
          }),
    );
  }
}
