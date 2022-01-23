// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:note_taking_app/models/model_item.dart';
import 'package:random_color/random_color.dart';

class ListData extends StatelessWidget {
  ListData({
    Key? key,
  }) : super(key: key);

  RandomColor randoomColor = RandomColor();

  final ref = Firestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount:
                    snapshot.hasData ? snapshot.data?.documents.length : 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: randoomColor.randomColor(colorHue: ColorHue.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(snapshot.data?.documents[index].data['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      SizedBox(height: 4),
                      Text(snapshot.data?.documents[index].data['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              );
            }));
  }
}

// class CustomList extends StatelessWidget {
//   const CustomList({
//     Key? key,
//     required this.products,
//     required this.press,
//   }) : super(key: key);

//   final Product products;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: press,
//       child: Container(
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: products.color,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           children: [
//             Text(products.title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 )),
//             Text(
//               products.desc,
//               style: TextStyle(
//                 color: Colors.black45,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
