import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/order_page/components/order_card_details.dart';
import 'package:infarm/pages/order_page/components/order_status.dart';
import 'package:intl/intl.dart'  as intl;


class OrderDetailsPage extends StatelessWidget {
  final dynamic data;
  const OrderDetailsPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: "Detail Pesanan".text.fontFamily(semiBold).make(),
      ),
      body: Column(
        children: [
          orderStatus(
            color: appBlue, icon: Icons.history_edu, title: "Pesanan Dibuat", isDone: data['order_placed']
          ),
          orderStatus(
            color: Colors.blue, icon: Icons.thumb_up, title: "Siap Dikirim", isDone: data['order_confirmed']
          ),
          orderStatus(
            color: Colors.purple, icon: Icons.fire_truck_rounded, title: "Dikirim", isDone: data['order_on_delivery']
          ),
          orderStatus(
            color: appYellow, icon: Icons.thumb_up, title: "Sampai", isDone: data['order_delivered']
          ),

          const Divider(),
          10.heightBox,
          orderCardDetails(
            title1: "Kode Transaksi",
            sub1: data['order_code'],
            title2: "Kurir Ekspedisi",
            sub2: data['shipping_method']
          ),
          orderCardDetails(
            title1: "Tanggal Pembelian",
            sub1: intl.DateFormat().add_yMd().format((data['order_date'].toDate())),
            title2: "Metode Pembayaran",
            sub2: data['payment_method']
          ),
          orderCardDetails(
            title1: "Status Pembayaran",
            sub1: "Telah Dibayar",
            title2: "Status Pengiriman",
            sub2: "Pesanan Dibuat"
          ),
          Row(
            children: [
              Column(
                children: [
                  'Alamat Penerima'.text.fontFamily(semiBold).make(),
                  // '${data['prder_by_name']}'
                ],
              ),

              Column(
                children: [

                ],
              )
            ],
          )

        ],
      ),
    );
  }
}