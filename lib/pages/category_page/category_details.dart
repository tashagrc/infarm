import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/product_controller.dart';
import 'package:infarm/pages/category_page/item_details.dart';
import 'package:infarm/services/firestore_services.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: StreamBuilder(
        stream: FirestorServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(categoryEmpty, width: 180,),
                  20.heightBox,
                  "Kategori ini masih kosong".text.size(17).color(grey).make()
                ],
              ),
            );
          }else{
            var data = snapshot.data!.docs;
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SUBKATEGORI ATAS
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                            .text
                            .size(12)
                            .fontFamily(semiBold)
                            .color(darkGrey)
                            .makeCentered()
                            .box
                            .white
                            .roundedSM
                            .size(150, 60)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .make()
                      ),
                    ),
                  ),
                  20.heightBox,
    
                  //PRODUCT LIST
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7)
                              ),
                              child: Image.network(
                                data[index]['pImages'][0],
                                fit: BoxFit.cover,
                                height: 160,
                                width: 200,
                              ).box.roundedSM.clip(Clip.antiAlias).make(),
                            ),
                            10.heightBox,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: "${data[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make(),
                            ),
                            7.heightBox,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: "${data[index]['pPrice']}".numCurrencyWithLocale(locale: "id").text.fontFamily(bold).color(appYellow).size(16).make(),
                            ),
                            7.heightBox
                          ],
                        ).box.white.roundedSM.outerShadowSm.margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                          Get.to(() => ItemDetails(title: "Detail Produk", data: data[index]));
                          }
                        );
                      }
                    )
                  )
                ],
              )
            );
          }
        }
      ),
    );
  }
}

