import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.vecteezy.com/system/resources/thumbnails/049/671/166/small/tiger-amazing-background-hd-wallpaper-photo.jpeg",
          ),
        ],
      ),
    );
  }
}
