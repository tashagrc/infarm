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
              color: appBlue, icon: Icons.history_edu, title: "Pesanan Dibuat", isDone: data['order_placed'], context: context
            ),
            orderStatus(
              color: Colors.blue, icon: Icons.thumb_up, title: "Siap Dikirim", isDone: data['order_confirmed'], context: context
            ),
            orderStatus(
              color: Colors.purple, icon: Icons.fire_truck_rounded, title: "Dikirim", isDone: data['order_on_delivery'], context: context
            ),
            orderStatus(
              color: appYellow, icon: Icons.card_giftcard_rounded, title: "Sampai", isDone: data['order_delivered'], context: context
            ),
      
            const Divider(thickness: 5,),
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
                const Divider(thickness: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Alamat Penerima'.text.fontFamily(semiBold).size(16).makeCentered(),
                      6.heightBox,
                      'Nama\t\t\t\t\t: ${data['order_by_name']}'.text.make(),
                      'Email\t\t\t\t\t\t: ${data['order_by_email']}'.text.make(),
                      'Alamat\t\t\t: ${data['order_by_street']}, ${data['order_by_kecamatan']}, ${data['order_by_city']}, ${data['order_by_province']}, ${data['order_by_postalcode']}'.text.make(),
                      'Telepon\t: ${data['order_by_phone']}'.text.make(),
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
                    orderCardDetailsPrice(
                      title1: data['orders'][index]['title'],
                      sub1: "${data['orders'][index]['quantity']}x",
                      title2: data['orders'][index]['totalPrice'],
                    ),
                  ],
                );
              }).toList()
            ).box.white.margin(const EdgeInsets.only(bottom: 4)).outerShadowMd.make(),
            10.heightBox,

            Column(
              children: [
                "Total Harga".text.size(20).fontFamily(bold).color(appYellow).makeCentered(),
                15.heightBox,
                totalPrice(title: "Sub Total", sub: data['total_amount'], context: context),
                totalPrice(title: "Ongkos Kirim", sub: 9000, context: context),
                totalPrice(title: "Pajak", sub: 0, context: context),
                totalPrice(title: "Biaya Admin", sub: 2500, context: context),
                7.heightBox,
                Divider(thickness: 2, color: Colors.white, indent: context.screenWidth*0.6),
                5.heightBox,
                grandTotal(title: "Grand Total", sub: data['total_amount'] + 9000 + 2500, context: context),

              ],
            ).box.color(appBlue).padding(const EdgeInsets.symmetric(horizontal: 15, vertical: 15)).make(),

          ],
        ),
      ),
    );
  }
}