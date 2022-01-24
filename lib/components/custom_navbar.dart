// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:note_taking_app/components/custom_list.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  String title = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.values[0],
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(
                  child: Text("Notes",
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                    child: Text("To Do",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.bold))),
                Tab(
                    child: Text("Meetings",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 400,
              width: 800,
              child: TabBarView(
                children: [
                  // SizedBox(height: 5),
                  ListData(),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Coming Soon!",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Coming Soon!",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //function to point if the button is active
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //creating a custom widget NavButton
  // Widget NavButton(String title, int index) {
  //   return TextButton(
  //       onPressed: () {
  //         changeIndex(index);
  //       },
  //       child: Text(title,
  //           style: TextStyle(
  //               fontWeight:
  //                   currentIndex == index ? FontWeight.bold : FontWeight.normal,
  //               color: currentIndex == index
  //                   ? Colors.blue[400]
  //                   : Colors.black54)));
  // }
}
