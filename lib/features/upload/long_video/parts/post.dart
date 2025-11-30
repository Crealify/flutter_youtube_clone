// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/upload/long_video/video_model.dart';

class Post extends StatelessWidget {
  final VideoModel video;
  const Post({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.vecteezy.com/system/resources/thumbnails/049/671/166/small/tiger-amazing-background-hd-wallpaper-photo.jpeg",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 5),
                child: CircleAvatar(radius: 20, backgroundColor: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  "First Video here",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.14,
            ),
            child: Row(
              children: [
                Text("Crealify", style: TextStyle(color: Colors.blueGrey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "No Views",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                Text("a moment ago", style: TextStyle(color: Colors.blueGrey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
