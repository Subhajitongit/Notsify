// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:note_taking_app/components/custom_appbar.dart';
import 'package:note_taking_app/components/custom_bottomBar.dart';
import 'package:note_taking_app/components/custom_navbar.dart';
import 'package:note_taking_app/components/custom_search_bar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //appbar section
            CustomAppBar(),
            //search bar section
            CustomSearchBar(),
            //navBar section
            CustomNavBar(),
          ],
        ),
      ),
    );
  }
}
