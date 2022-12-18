import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/product_controller.dart';

import '../category_page/category_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
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
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                filled: true,
                fillColor: white,
                hintText: "Apa yang ingin Anda beli ?",
                hintStyle: TextStyle(color: grey)
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
                    itemBuilder: (
                      (context, index) {
                        return Image.asset(
                          ads[index],
                          fit: BoxFit.cover,
                        ).box.clip(Clip.antiAlias).make();
                      }
                    )
                  ),
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
                              controller.getSubCategories(categoryNameList[index]);
                              Get.to(
                                () => CategoryDetails(title: categoryNameList[index])
                              );
                            }
                          );
                        }),
                  ),

                  10.heightBox,

                  //PRODUK UNGGULAN
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(featuredBg), fit: BoxFit.cover)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Produk Unggulan".text.color(white).fontFamily(bold).size(20).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              6,
                              (index) => Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(7)),
                                    child: Image.asset(
                                      product1,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  10.heightBox,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: "Pestisida Pesnab".text.fontFamily(semiBold).color(darkGrey).make(),
                                  ),
                                  7.heightBox,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: "Rp24.000".text.fontFamily(bold).color(appYellow).size(16).make(),
                                  ),
                                  7.heightBox
                                ],
                              ).box.white.roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).make()
                            ),
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
                      child: "Semua Produk"
                        .text
                        .color(appBlue)
                        .size(20)
                        .fontFamily(bold)
                        .make(),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(5),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)
                            ),
                            child: Image.asset(product1, width: 200, height: 170, fit: BoxFit.cover)
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: "Pestisida Pesnab".text.fontFamily(semiBold).color(darkGrey).make(),
                          ),
                          10.heightBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: "Rp24.000" .text.fontFamily(bold).color(appYellow).size(16).make(),
                          ),
                          10.heightBox,
                        ],
                      ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
                    },
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