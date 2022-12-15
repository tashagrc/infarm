import 'package:infarm/constants/constantBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const ads = [
      ads1,
      ads2,
    ];
    return Stack(
      children: [
        Container(
          color: appBlue,
          height: context.screenHeight * 0.26,
          width: context.screenWidth,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: context.screenWidth,
          child: SafeArea(
            child: Column(
              children: [
                Container(
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
                10.heightBox,
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        VxSwiper.builder(
                          autoPlay: true,
                          viewportFraction: 1.02,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          itemCount: ads.length, 
                          itemBuilder: ((context, index) {
                            return Image.asset(ads[index], fit: BoxFit.fill,)
                            .box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 5)).make();
                          })
                        ),
                      ],
                    ),
                  ),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: "Semua Kategori".text.color(appBlue).size(16).fontFamily(bold).make(),
                ),
                5.heightBox,
                
                //NANTI MASUKIN AJA YAH UNTUK KATEGORINYA

                //END CATEGORY CODE

                

              ],
            ),
          ),
        ),
      ],
    );
  }
}