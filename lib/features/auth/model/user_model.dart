
import 'dart:convert';
import 'dart:ffi';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;
  final List subscriptions;
  final int videos;
  final String description;
  final String type;
  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.subscriptions,
    required this.videos,
    required this.description,
    required this.type,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'subscriptions': subscriptions,
      'videos': videos,
      'description': description,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      subscriptions: List.from((map['subscriptions'] as List),
      videos: map['videos'] as int,
      description: map['description'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
