// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoModel {
  final String vidoeUrl;
  final String thumbnail;
  final String title;
  final String datePublished;
  final String views;
  final String videoId;
  final String userId;
  final List likes;
  final String type;
  VideoModel({
    required this.vidoeUrl,
    required this.thumbnail,
    required this.title,
    required this.datePublished,
    required this.views,
    required this.videoId,
    required this.userId,
    required this.likes,
    required this.type,
  });
}
