import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/order_page/order_details_page.dart';
import 'package:infarm/services/firestore_services.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Pesanan Saya".text.fontFamily(semiBold).make(),
      ),
      body: StreamBuilder(
        stream: FirestorServices.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(appBlue),),);
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categoryEmpty,
                    width: 180,
                  ),
                  20.heightBox,
                  "Kamu masih belum memiliki pesanan.".text.size(17).color(grey).make()
                ],
              ),
            );
          }else{
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: "${index+1}".text.fontFamily(bold).color(darkGrey).xl.make(),
                  trailing: IconButton(
                    onPressed: (){
                      Get.to(()=> OrderDetailsPage(data: data[index]));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded, color: appBlue,),
                  ),
                  title: data[index].id.toString().text.color(appBlue).fontFamily(semiBold).make(),
                  subtitle: data[index]['total_amount'].toString().numCurrencyWithLocale(locale: 'id').text.color(darkGrey).fontFamily(bold).make(),
                );
              },
            );
          }
        },
      ),
    );
  }
}