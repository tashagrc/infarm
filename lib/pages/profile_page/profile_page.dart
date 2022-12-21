import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/controller/auth_controller.dart';
import 'package:infarm/controller/profile_controller.dart';
import 'package:infarm/pages/authentication_page/login_page.dart';
import 'package:infarm/pages/chat_screen/messaging_screen.dart';
import 'package:infarm/pages/order_page/order_page.dart';
import 'package:infarm/pages/profile_page/edit_profile_page.dart';
import 'package:infarm/pages/wishlist_page/wishlist_page.dart';
import 'package:infarm/services/firestore_services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());

    const btnList = ["Pesanan", "Favorit", "Message", "Ubah Profile"];
    const btnIcon = [historyIcon, favIcon, chatIcon, profileIcon];

    User? currentUser = auth.currentUser;
    
    return Scaffold(
      body: StreamBuilder(
        stream: FirestorServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),),);
          }else{
            var data = snapshot.data!.docs[0];
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(batikBg), fit: BoxFit.fill)
                  ),
                ),
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              data['imageUrl'] == '' 
                              ?Image.asset(profilePic, width: 70, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                              :Image.network(data['imageUrl'], width: 70, height: 70, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                              
                              10.widthBox,
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}".text.fontFamily(semiBold).white.make(),
                                  5.heightBox,
                                  "${data['email']}".text.white.make()
                                ],
                              )),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: white
                                  )
                                ),
                                onPressed: () async{
                                  await Get.put(AuthController()).signOutMethod(context);
                                  Get.offAll(() => const LoginPage());
                                }, 
                                icon: const Icon(Icons.logout_rounded, color: white),
                                label: "Keluar".text.white.fontFamily(bold).make(),
                              )
                            ],
                          ),
                        ),

                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "${data['cartCount']}".text.fontFamily(bold).color(darkGrey).size(16).make(),
                                5.heightBox,
                                "Item di keranjang".text.color(darkGrey).align(TextAlign.center).make(),
                              ],
                            ).box.white.roundedSM.width(context.screenWidth/2.2).height(75).padding(const EdgeInsets.all(4)).make(),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "${data['orderCount']}".text.fontFamily(bold).color(darkGrey).size(16).make(),
                                5.heightBox,
                                "Total transaksi".text.color(darkGrey).make(),
                              ],
                            ).box.white.roundedSM.width(context.screenWidth/2.2).height(75).padding(const EdgeInsets.all(4)).make(),
                          
                          ],
                        ),
                        25.heightBox,
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(color: grey,);
                          },
                          itemCount: btnList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(btnIcon[index], width: 22, color: appBlue,),
                              title: btnList[index].text.fontFamily(semiBold).make(),
                              onTap: () {
                                if(index == 0){
                                  Get.to(()=> const OrderPage());
                                }else if(index == 1){
                                  Get.to(()=> const WishlistPage());
                                }else if(index == 2){
                                  Get.to(()=> const MessagingPage());
                                }else if(index == 3){
                                  controller.nameController.text = data['name'];
                                  Get.to(() => EditProfilePage(data: data,));
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

        },
      ),
    );
  }
}