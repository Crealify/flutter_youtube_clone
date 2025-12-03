// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube_clone/features/auth/pages/flat_button.dart';
import 'package:youtube_clone/features/upload/short_video/repository/short_video_reposotory.dart';

// adding provider
final shortVideoProvider = Provider(
  (ref) => ShortVideoReposotory(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class ShortVideoDetailsPage extends ConsumerStatefulWidget {
  final File video;
  const ShortVideoDetailsPage({super.key, required this.video});

  @override
  ConsumerState<ShortVideoDetailsPage> createState() =>
      _ShortVideoDetailsPageState();
}

class _ShortVideoDetailsPageState extends ConsumerState<ShortVideoDetailsPage> {
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
                  controller: captionController,
                  // controller: captionController!
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
                    onPressed: () async {
                      await ref
                          .watch(shortVideoProvider)
                          .addShortVideoToFirestore(
                            caption: captionController.text,
                            video: widget.video.path,
                            datePublished: date,
                          );
                    },
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
