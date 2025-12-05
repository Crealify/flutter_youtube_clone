// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

final longVideoProvider = Provider(
  (ref) => VideoRepository(firestore: FirebaseFirestore.instance),
);

class VideoRepository {
  FirebaseFirestore firestore;
  VideoRepository({required this.firestore});

  uploadvideoToFirestore({
    required String videoUrl,
    required String thumbnail,
    required String title,
    required String videoId,
    required DateTime datePublished,
    required String userId,
  }) async {
    VideoModel video = VideoModel(
      vidoeUrl: videoUrl,
      thumbnail: thumbnail,
      title: title,
      datePublished: datePublished,
      views: 0,
      videoId: videoId,
      userId: userId,
      likes: [],
      type: "video",
    );
    await firestore.collection("videos").doc(videoId).set(video.toMap());
  }
//likes is a type of future and doesnot return so it is void type
  Future<void>likeVideo({List? likes, videoId, currentUserId}) async {
    if (!likes!.contains(currentUserId)) {
      await FirebaseFirestore.instance.collection("videos").doc(videoId).update({
        // arrayUnion is used to modified and update field documents
        "likes": FieldValue.arrayUnion([currentUserId]),
      });
    }
    if (likes.contains(currentUserId)) {
      await FirebaseFirestore.instance.collection("videos").doc(videoId).update({
        // arrayUnion is used to modified and update field documents
        "likes": FieldValue.arrayRemove([currentUserId]),
      });
    }
  }
}
