import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/product_controller.dart';
import 'package:infarm/pages/category_page/item_details.dart';
import 'package:infarm/services/firestore_services.dart';
import 'package:intl/intl.dart'  as intl;


class CategoryDetails extends StatefulWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override


  void initState() {
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      productMethod = FirestorServices.getSubCategoryProduct(title);
    } else {
      productMethod = FirestorServices.getProducts(title);
    }
  }

  var controller = Get.find<ProductController>();
  dynamic productMethod;
  String currentTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title!.text.fontFamily(bold).white.make(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SUBKATEGORI ATAS
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  controller.subcat.length,
                  (index) => controller.subcat[index] == currentTitle
                  ?"${controller.subcat[index]}"
                    .text
                    .size(12)
                    .fontFamily(semiBold)
                    .color(appBlue)
                    .makeCentered()
                    .box
                    .color(appLightYellow)
                    .roundedSM
                    .size(150, 60)
                    .margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 0))
                    .make()
                    .onTap(() {
                      switchCategory("${controller.subcat[index]}");
                      setState(() {});
                    })
                  :"${controller.subcat[index]}"
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
                    .onTap(() {
                      currentTitle = controller.subcat[index];
                      switchCategory("${controller.subcat[index]}");
                      setState(() {});
                    })
                  
              ),
            ),
          ),
          0.heightBox,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: StreamBuilder(
                  stream: productMethod,
                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                width: 200,
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                              ),
                              10.heightBox,
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Skeleton(15, 140),
                              ),
                              7.heightBox,
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Skeleton(20, 100)
                              ),
                              7.heightBox
                            ],
                          ).box.white.roundedSM.outerShadowSm.margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 4)).make();
                        }
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(categoryEmpty,width: 180,),
                            20.heightBox,
                            "Kategori ini masih kosong".text.size(17).color(darkGrey).makeCentered()
                          ],
                        ),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                                child: FadeInImage.assetNetwork(
                                  placeholder: imageLoading,
                                  image: data[index]['pImages'][0],
                                  fit: BoxFit.cover,
                                  height: 160,
                                  width: 200,
                                ).box.clip(Clip.antiAlias).make(),
                              ),
                              10.heightBox,
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 8),
                                child: data[index]['pName'].toString().length > 18
                                  ?"${data[index]['pName'].toString().substring(0, 18)}...".text.fontFamily(semiBold).color(darkGrey).make()
                                  :"${data[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make()
                              ),
                              7.heightBox,
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  intl.NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 2,
                                  ).format(int.parse(data[index]['pPrice'])),
                                  style: const TextStyle(
                                    fontFamily: bold,
                                    fontSize: 16,
                                    color: appYellow
                                  ),
                                ),
                              ),
                              7.heightBox
                            ],
                          ).box.white.roundedSM.outerShadowSm.margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 4)).make().onTap(() {
                              controller.checkFavorite(data[index]);
                              Get.to(() => ItemDetails(
                                  title: "Detail Produk", data: data[index])
                              );
                            }
                          );
                        }
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
