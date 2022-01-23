// ignore_for_file: prefer_const_constructors, duplicate_ignore, import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  CollectionReference ref = Firestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                ref.add({
                  'title': titleController.text,
                  'description': descController.text
                }).whenComplete(() => Navigator.pop(context));
              },
              icon: Icon(Icons.check, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  VxToast.show(context, msg: "Feature Coming Soon!");
                },
                icon: Icon(Icons.push_pin_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red)),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              TextFormField(
                controller: titleController,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 1),
              TextFormField(
                controller: descController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
