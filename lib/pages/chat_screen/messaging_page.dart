import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/chat_screen/chat_screen.dart';
import 'package:infarm/services/firestore_services.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Chat Dengan Penjual".text.fontFamily(semiBold).make(),
      ),
      body: StreamBuilder(
        stream: FirestorServices.getAllMessages(),
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
                  "Pesan masih kosong".text.size(17).color(grey).make()
                ],
              ),
            );
          }else{
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: ListTile(
                            onTap: (){
                              Get.to(()=> ChatScreen(), 
                              arguments: [data[index]['pSeller'], data[index]['vendorID']],
                              );
                              
                            },
                            leading: const CircleAvatar(
                              backgroundColor: appYellow,
                              child: Icon(Icons.person, color: white,),
                            ),
                            title: "${data[index]['friend_name']}".text.fontFamily(semiBold).make(),
                            subtitle: "${data[index]['last_message']}".text.make(),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}