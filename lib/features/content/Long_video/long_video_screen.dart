import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/upload/long_video/parts/post.dart';

class LongVideoScreen extends StatelessWidget {
  const LongVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("video").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Post();
            },
          );
        },
      ),
    );
  }
}
