import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/home_controller.dart';
import 'package:infarm/controller/product_controller.dart';
import 'package:infarm/pages/category_page/item_details.dart';
import 'package:infarm/pages/homescreen_page/search_page.dart';
import 'package:infarm/services/firestore_services.dart';
import 'package:intl/intl.dart'  as intl;
import '../category_page/category_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    var productController = Get.put(ProductController());
    var searchController = Get.find<HomeController>();
    const ads = [
      ads1,
      ads2,
    ];
    return Scaffold(
      backgroundColor: bgWhite,
      body: Column(
        children: [
          Container(
            padding:const EdgeInsets.only(right: 10, left: 10, top: 45, bottom: 10),
            decoration: const BoxDecoration(color: appBlue),
            width: context.screenWidth,
            alignment: Alignment.center,
            child: TextFormField(
              
              controller: searchController.searchController,
              onEditingComplete: () => Get.to(() => SearchScreen(title: searchController.searchController.text,)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded).onTap(() {
                  if (searchController.searchController.text.isNotEmptyAndNotNull) {
                    Get.to(() => SearchScreen(
                        title: searchController.searchController.text,
                      )
                    );
                  }
                }),
                filled: true,
                fillColor: white,
                hintText: "Apa yang ingin Anda beli ?",
                hintStyle: const TextStyle(color: grey)
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayInterval: const Duration(seconds: 4),
                      itemCount: ads.length,
                      itemBuilder: ((context, index) {
                        return Image.asset(
                          ads[index],
                          fit: BoxFit.cover,
                        ).box.clip(Clip.antiAlias).make();
                      })),
                  25.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: "Semua Kategori".text.color(appBlue).size(20).fontFamily(bold).make(),
                    ),
                  ),
                  5.heightBox,

                  // CATEGORY
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 100
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.asset(categoryImages[index],height: 100, width: 300, fit: BoxFit.cover),
                              Center(
                                child: categoryNameList[index]
                                  .text
                                  .color(white)
                                  .align(TextAlign.center)
                                  .fontFamily(bold)
                                  .size(20)
                                  .make()
                              ),
                            ],
                          ).box.white.roundedSM.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                              productController.getSubCategories(categoryNameList[index]);
                              Get.to(() => CategoryDetails(title: categoryNameList[index]));
                          });
                        }),
                  ),

                  10.heightBox,

                  //PRODUK UNGGULAN
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(featuredBg), fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Produk Unggulan".text.color(white).fontFamily(bold).size(20).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: FutureBuilder(
                              future: FirestorServices.getFeaturedProducts(),
                              builder: (context, AsyncSnapshot<QuerySnapshot>featuredsnapshot) {
                                if (!featuredsnapshot.hasData) {
                                  return Row(
                                    children: List.generate(
                                      4,
                                      (index) => Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.1),
                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))
                                            ),
                                          ),
                                          
                                          10.heightBox,
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Skeleton(15, 125),
                                          ),
                                          
                                          7.heightBox,
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Skeleton(15, 100),
                                          ),
                                          7.heightBox
                                        ],
                                      ).box.white.roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).make()
                                    ),
                                  );
                                }else {
                                  var featuredData =featuredsnapshot.data!.docs;
                                  return Row(
                                    children: List.generate(
                                      featuredData.length,
                                      (index) => Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(borderRadius:
                                            const BorderRadius.only(topLeft:Radius.circular(7),topRight:Radius.circular(7)),
                                            child: FadeInImage.assetNetwork(
                                              imageErrorBuilder: (context, error, stackTrace) {
                                                return Image.asset(notLoaded, width: 150, height: 150,);
                                              },
                                              placeholder: imageLoading,
                                              image: featuredData[index]['pImages'][0],
                                              width: 170,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          10.heightBox,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child:"${featuredData[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make(),
                                          ),
                                          7.heightBox,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child:Text(
                                              intl.NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp ',
                                                decimalDigits: 2,
                                              ).format(int.parse(featuredData[index]['pPrice'])),
                                              style: const TextStyle(
                                                fontFamily: bold,
                                                fontSize: 16,
                                                color: appYellow
                                              ),
                                            ),
                                          ),
                                          7.heightBox
                                        ],
                                      ).box.white.roundedSM.width(170).height(220).margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                                          Get.to(() => ItemDetails(title:"${featuredData[index]['pName']}",data: featuredData[index],));
                                        }
                                      )
                                    ),
                                  );
                                }
                              }
                            ),
                          ),
                        ],
                    ),
                  ),
                  30.heightBox,

                  //SEMUA PRODUK
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: "Semua Produk".text.color(appBlue).size(20).fontFamily(bold).make(),
                    ),
                  ),
                  StreamBuilder(
                    stream: FirestorServices.allProducts(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(5),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 1,
                            mainAxisExtent: 270
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 210,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))
                                  ),
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Skeleton(15, 160)
                                ),
                                10.heightBox,
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Skeleton(15, 120)
                                ),
                                10.heightBox,
                              ],
                            )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 10))
                            .roundedSM
                            .make();
                          },
                        );
                      }else {
                        var allProductsData = snapshot.data!.docs;
                        return GridView.builder(
                          padding: const EdgeInsets.all(5),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allProductsData.length,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 1,
                            mainAxisExtent: 270
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: imageLoading,
                                      image: allProductsData[index]['pImages'][0],
                                      width: 200,
                                      height: 170,
                                      fit: BoxFit.cover,
                                    )
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: "${allProductsData[index]['pName']}".text.fontFamily(semiBold).color(darkGrey).make(),
                                ),
                                10.heightBox,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    intl.NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 2,
                                    ).format(int.parse(allProductsData[index]['pPrice'])),
                                    style: const TextStyle(
                                      fontFamily: bold,
                                      fontSize: 16,
                                      color: appBlue
                                    ),
                                  ),
                                ),
                                10.heightBox,
                              ],
                            )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4, vertical: 10))
                            .roundedSM
                            .make()
                            .onTap(() {
                              Get.to(() => ItemDetails(
                                title:"${allProductsData[index]['pName']}",
                                data: allProductsData[index],
                              ));
                            });
                          },
                        );
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
