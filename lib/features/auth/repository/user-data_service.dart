// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataService({required this.auth, required this.firestore});
  addUserDataToFirestore({
    required String displayName,
    required String username,
    required String email,
    required String profilePic,
    required List subscriptions,
    required int videos,
    required String description,
    required String type,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: subscriptions,
      videos: videos,
      description: description,
      type: type,
    );
  }
}
