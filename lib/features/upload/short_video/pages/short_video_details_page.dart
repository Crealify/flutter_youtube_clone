// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:youtube_clone/features/auth/pages/flat_button.dart';

class ShortVideoDetailsPage extends StatefulWidget {
  final File video;
  const ShortVideoDetailsPage({super.key, required this.video});

  @override
  State<ShortVideoDetailsPage> createState() => _ShortVideoDetailsPageState();
}

class _ShortVideoDetailsPageState extends State<ShortVideoDetailsPage> {
  final captionController = TextEditingController();
  final DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Detials Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 20, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: captionController!,
                  decoration: InputDecoration(
                    hintText: "Write a Capiton.",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FlatButton(
                    text: "PUBLISH",
                    onPressed: () {},
                    colour: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
