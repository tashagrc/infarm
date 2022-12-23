import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/services/firestore_services.dart';



class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});
  @override
  Widget build(BuildContext context) {
    User? currentUserWish = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: "Favorit Saya".text.fontFamily(semiBold).make(),
      ),
      body: StreamBuilder(
        stream: FirestorServices.getWishlist(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),),);
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    favEmpty,
                    width: 180,
                  ),
                  20.heightBox,
                  "Produk Favoritmu masih kosong.".text.size(17).color(grey).make()
                ],
              ),
            );
          }else{
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading:
                            Image.network('${data[index]['pImages'][index]}'),
                        title:
                            "${data[index]['pName']}"
                                .richText
                                .fontFamily(semiBold)
                                .size(16)
                                .make(),
                        subtitle: "${data[index]['pPrice']}"
                            .numCurrencyWithLocale(locale: 'id')
                            .text
                            .color(appBlue)
                            .fontFamily(bold)
                            .size(16)
                            .make(),
                        trailing: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ).onTap(() async {
                          VxToast.show(context, msg: "Favorit berhasil dihapus");
                          await firestore.collection(productsCollection).doc(data[index].id).set({
                            'pWishlist': FieldValue.arrayRemove([currentUserWish!.uid])
                          }, SetOptions(merge: true));
                          
                        }),
                      );
                    }
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