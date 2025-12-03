// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_clone/features/upload/short_video/model/short_vidoe_mode.dart';

class ShortVideoReposotory {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  ShortVideoReposotory({required this.auth, required this.firestore});

  Future<void> addShortVideoToFirestore({
    required String caption,
    required String userId,
    required String video,
    required DateTime datePublished,
  }) async {
    ShortVideoModel shortvideo = ShortVideoModel(
      caption: caption,
      userId: userId,
      shortVideo: video,
      datePublished: datePublished,
    );
    await firestore.collection("shorts").add(shortvideo.toMap());
  }
}
