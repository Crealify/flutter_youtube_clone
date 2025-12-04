import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

import '../../upload/long_video/video_model.dart';

final allChannelsProvider = FutureProvider<List<UserModel>>((ref) async {
  final usersMap = await FirebaseFirestore.instance.collection("user").get();

  return usersMap.docs.map((user) => UserModel.fromMap(user.data())).toList();
});

final allVideosProvider = FutureProvider<List<VideoModel>>((ref) async {
  final videosMap = await FirebaseFirestore.instance.collection("videos").get();

  return videosMap.docs
      .map((video) => VideoModel.fromMap(video.data()))
      .toList();
});
