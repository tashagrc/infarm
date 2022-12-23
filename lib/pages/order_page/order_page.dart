import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/order_page/order_details_page.dart';
import 'package:infarm/services/firestore_services.dart';
import 'package:intl/intl.dart'  as intl;
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
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Skeleton(35, 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Skeleton(15, 230),
                            5.heightBox,
                            const Skeleton(20, 130),
                            5.heightBox,
                            const Skeleton(14, 150)
                          ],
                      ),
                      const Skeleton(35, 35)
                    ],
                  ),
                );
              },
            );
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
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "${index+1}".text.fontFamily(bold).color(darkGrey).xl.make(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Order ID: ${data[index].id}".toString().text.color(appBlue).fontFamily(semiBold).make(),
                            Text(
                              intl.NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 2,
                              ).format(data[index]['total_amount']),
                              style: const TextStyle(
                                fontFamily: bold,
                                fontSize: 16,
                                color: appBlue
                              ),
                            ),
                            "Tanggal: ${intl.DateFormat.yMd().add_jm().format((data[index]['order_date'].toDate()))}".text.make()
                          ],
                      ),

                      IconButton(
                        onPressed: (){
                          Get.to(()=> OrderDetailsPage(data: data[index]));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded, color: appBlue,),
                      ),

                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}