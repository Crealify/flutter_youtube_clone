import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

final allChannelsProvider = Provider((ref) async {
  final usersMap = await FirebaseFirestore.instance.collection("user").get();
  List<UserModel> users = usersMap.docs
      .map((user) => UserModel.fromMap(user.data()))
      .toList();
  return users;
});
final allVideosProvider = Provider((ref) async {
  final usersMap = await FirebaseFirestore.instance.collection("vidoes").get();
  List<UserModel> video = usersMap.docs
      .map((video) => UserModel.fromMap(video.data()))
      .toList();
  return video;
});
