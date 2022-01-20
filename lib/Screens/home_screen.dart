// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:note_taking_app/components/custom_appbar.dart';
import 'package:note_taking_app/components/custom_bottomBar.dart';
import 'package:note_taking_app/components/custom_list.dart';
import 'package:note_taking_app/components/custom_navbar.dart';
import 'package:note_taking_app/components/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            //models section
            ListData()
          ],
        ),
      ),
    );
  }
}
