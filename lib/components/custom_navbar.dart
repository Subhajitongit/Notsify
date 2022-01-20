// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          NavButton("Notes", 0),
          NavButton("To Do", 1),
          NavButton("Meetings", 2),
        ],
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
  Widget NavButton(String title, int index) {
    return TextButton(
        onPressed: () {
          changeIndex(index);
        },
        child: Text(title,
            style: TextStyle(
                fontWeight:
                    currentIndex == index ? FontWeight.bold : FontWeight.normal,
                color: currentIndex == index
                    ? Colors.blue[400]
                    : Colors.black54)));
  }
}
