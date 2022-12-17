import 'package:infarm/constants/constantBuilder.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            //APPBAR SUBKATEGORI 
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => "Subcategory"
                    .text.size(12)
                    .fontFamily(semiBold)
                    .color(darkGrey)
                    .makeCentered()
                    .box
                    .white
                    .roundedSM
                    .size(150, 60)
                    .margin(const EdgeInsets.symmetric(horizontal: 4)
                  ).make()
                ),
              ),
            ),
            20.heightBox,

            //LIST PRODUK
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
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
                          topRight: Radius.circular(7)),
                        child: Image.asset(
                          product1,
                          // width: 150, DELETE HIM!
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
                  )
                  .box
                  .white
                  .roundedSM
                  .outerShadowSm
                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                  .make();
                }
              )
            )
          ],
        )
      )
    );
  }
}
