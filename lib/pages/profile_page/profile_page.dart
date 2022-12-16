import 'package:infarm/constants/constantBuilder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    const btnList = ["Pesananmu", "Favorit", "Ubah Profile"];
    const btnIcon = [historyIcon, favIcon, profileIcon];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(batikBg), fit: BoxFit.fill)
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(profilePic, width: 70, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.widthBox,
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "John Doe".text.fontFamily(semiBold).white.make(),
                          5.heightBox,
                          "email@gmail.com".text.white.make()
                        ],
                      )),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: white
                          )
                        ),
                        onPressed: (){

                        }, 
                        icon: const Icon(Icons.logout_rounded, color: white),
                        label: "Keluar".text.white.fontFamily(bold).make(),
                      )
                    ],
                  ),
                ),

                13.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "00".text.fontFamily(bold).color(darkGrey).size(16).make(),
                        5.heightBox,
                        "Item keranjang".text.color(darkGrey).align(TextAlign.center).make(),
                      ],
                    ).box.white.roundedSM.width(context.screenWidth/3.4).height(75).padding(const EdgeInsets.all(4)).make(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "90".text.fontFamily(bold).color(darkGrey).size(16).make(),
                        5.heightBox,
                        "Favorit".text.color(darkGrey).make(),
                      ],
                    ).box.white.roundedSM.width(context.screenWidth/3.4).height(75).padding(const EdgeInsets.all(4)).make(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "210".text.fontFamily(bold).color(darkGrey).size(16).make(),
                        5.heightBox,
                        "Total transaksi".text.color(darkGrey).make(),
                      ],
                    ).box.white.roundedSM.width(context.screenWidth/3.4).height(75).padding(const EdgeInsets.all(4)).make(),
                  
                  ],
                ),
                25.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(color: grey,);
                  },
                  itemCount: btnList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(btnIcon[index], width: 22, color: appBlue,),
                      title: btnList[index].text.fontFamily(semiBold).make(),

                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}