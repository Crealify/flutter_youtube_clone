// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/upload/comments/comment_model.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;
  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider(
                    comment.profilePic,
                  ),
                ),
              ),
              SizedBox(width: 10),

              Text(
                comment.displayName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 5),
              const Text("a moment ago"),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 42,
              // right: 10,
              right: MediaQuery.sizeOf(context).width * 0.4,
            ),
            child: Text(comment.commentText),
          ),
        ],
      ),
    );
  }
}
