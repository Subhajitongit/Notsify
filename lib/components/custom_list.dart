import 'package:flutter/material.dart';
import 'package:note_taking_app/models/model_item.dart';


class ListData extends StatelessWidget {
  const ListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemBuilder: (context, index) => CustomList(
          products: products[index],
          press: () {},
        ),
      ),
    );
  }
}

class CustomList extends StatelessWidget {
  const CustomList({
    Key? key,
    required this.products,
    required this.press,
  }) : super(key: key);

  final Product products;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: products.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(products.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            Text(
              products.desc,
              style: TextStyle(
                color: Colors.black45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
