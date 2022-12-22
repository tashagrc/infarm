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
      backgroundColor: white,
      appBar: AppBar(
        title: "Detail Pesanan".text.fontFamily(semiBold).make(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
              color: appYellow, icon: Icons.card_giftcard_rounded, title: "Sampai", isDone: data['order_delivered']
            ),
      
            const Divider(),
            10.heightBox,
            Column(
              children: [
                orderCardDetails(
                  title1: "Kode Transaksi",
                  sub1: data.id,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Alamat Penerima'.text.fontFamily(semiBold).make(),
                          '${data['order_by_name']}'.text.make(),
                          '${data['order_by_email']}'.text.make(),
                          '${data['order_by_street']}'.text.make(),
                          '${data['order_by_city']}'.text.make(),
                          '${data['order_by_province']}'.text.make(),
                          '${data['order_by_phone']}'.text.make(),
                          '${data['order_by_postalcode']}'.text.make(),
                        ],
                      ),
      
                      SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Total Harga".text.fontFamily(semiBold).make(),
                            "${data['total_amount']}".numCurrencyWithLocale(locale: 'id').text.color(appBlue).fontFamily(bold).make()
                          ],
                        ),
                      )
                    ],
                  ),
                )
      
              ],
            ).box.outerShadowMd.white.make(),
      
            const Divider(),
            10.heightBox,
      
            "Produk yang dibeli".text.size(16).color(darkGrey).fontFamily(semiBold).makeCentered(),
            10.heightBox,
      
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(data['orders'].length, (index) {
                return Column(
                  children: [
                    orderCardDetails(
                      title1: data['orders'][index]['title'],
                      sub1: "${data['orders'][index]['quantity']}x",
                      title2: data['orders'][index]['totalPrice']
                    ),
                  ],
                );
              }).toList()
            ).box.white.margin(const EdgeInsets.only(bottom: 4)).outerShadowMd.make(),
            10.heightBox,

            Row(
              children: [
                "Harga: ".text.size(16).fontFamily(semiBold).color(darkGrey).make()
              ],
            )

          ],
        ),
      ),
    );
  }
}