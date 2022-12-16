import 'package:infarm/constants/constantBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const ads = [
      ads1,
      ads2,
    ];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 45, bottom: 10),
          decoration: const BoxDecoration(
            color: appBlue
          ),
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                15.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: VxSwiper.builder(
                    autoPlay: true,
                    viewportFraction: 1.02,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    itemCount: ads.length, 
                    itemBuilder: ((context, index) {
                      return Image.asset(ads[index], fit: BoxFit.fill,)
                      .box.roundedSM.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 5)).make();
                    })
                  ),
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
                
                //NANTI MASUKIN KODENYA DISINI AJA YAH UNTUK KATEGORINYA

                //END CATEGORY CODE

                10.heightBox,
                
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xffF83B05)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Produk Unggulan".text.color(white).fontFamily(bold).size(20).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(6, (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(product1, width: 150, fit: BoxFit.cover,),
                              ),
                              
                              10.heightBox,
                              "Pestisida Pesnab".text.fontFamily(semiBold).color(darkGrey).make(),
                              7.heightBox,
                              "Rp24.000".text.fontFamily(bold).color(appYellow).size(16).make()
                            ],
                          ).box.white.roundedSM.padding(const EdgeInsets.all(8)).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                        ),
                      ),
                    ],  
                  ),
                ),
                30.heightBox,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: "Semua Produk".text.color(appBlue).size(20).fontFamily(bold).make(),
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(5),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 1, mainAxisExtent: 270),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(product1, width: 200,height: 170, fit: BoxFit.cover)
                        ),
                        const Spacer(),
                        "Pestisida Pesnab".text.fontFamily(semiBold).color(darkGrey).make(),
                        10.heightBox,
                        "Rp24.000".text.fontFamily(bold).color(appYellow).size(16).make(),
                        10.heightBox,
                      ],
                    ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).padding(const EdgeInsets.all(8)).roundedSM.make();
                  },
                ),
              ],
            ),
          ),
        ),
        
      ],
    );
  }
}