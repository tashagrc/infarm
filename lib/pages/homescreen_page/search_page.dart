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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.heightBox,
                    "Hasil Pencarian".text.color(appBlue).size(20).fontFamily(semiBold).make(),
                    "Jumlah produk ditemukan: ${filteredData.length}".text.color(grey).size(15).make(),
                    const Divider(thickness: 2,color: lightGrey),
                    Expanded(
                      child: GridView(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
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
                              child: filteredData[index]['pName'].toString().length > 27
                                  ?"${filteredData[index]['pName'].toString().substring(0, 27)}...".text.fontFamily(semiBold).color(darkGrey).make()
                                  :"${filteredData[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make()
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
                        ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 8)).roundedSM.outerShadowMd.make().onTap(() {
                          Get.to(() => ItemDetails(title: "${filteredData[index]['pName']}",data: filteredData[index],));
                        })
                        ).toList()
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
