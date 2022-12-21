import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/services/firestore_services.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Pesanan Saya".text.fontFamily(semiBold).make(),
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
            return Container();
          }
        },
      ),
    );
  }
}