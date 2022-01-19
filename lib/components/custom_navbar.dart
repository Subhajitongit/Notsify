// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          NavButton(isActive: true, title: "Notes", press: () {}),
          NavButton(title: "To Do", press: () {}),
          NavButton(title: "Meetings", press: () {}),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  NavButton({
    Key? key,
    this.isActive = false,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(title,
            style: TextStyle(
              fontWeight:
                  isActive == true ? FontWeight.bold : FontWeight.normal,
            )));
  }
}
