import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShortVidoeModel {
  final String caption;
  final String userId;
  final String shortVideo;
  final DateTime datePublished;
  ShortVidoeModel({
    required this.caption,
    required this.userId,
    required this.shortVideo,
    required this.datePublished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caption': caption,
      'userId': userId,
      'shortVideo': shortVideo,
      'datePublished': datePublished.millisecondsSinceEpoch,
    };
  }

  factory ShortVidoeModel.fromMap(Map<String, dynamic> map) {
    return ShortVidoeModel(
      caption: map['caption'] as String,
      userId: map['userId'] as String,
      shortVideo: map['shortVideo'] as String,
      datePublished: DateTime.fromMillisecondsSinceEpoch(map['datePublished'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortVidoeModel.fromJson(String source) => ShortVidoeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
