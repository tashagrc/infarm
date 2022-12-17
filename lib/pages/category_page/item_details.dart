import 'package:infarm/constants/constantBuilder.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
            title: title!.text.color(darkGrey).fontFamily(bold).make(),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: darkGrey),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  color: darkGrey),
            ]),
        body: Container());
  }
}
