// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/upload/comments/comment_model.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;
  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 15, backgroundColor: Colors.grey),

              Text(
                "Anil Bhattarai",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text("a moment ago"),
              const Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          Text("First comment on the platform "),
        ],
      ),
    );
  }
}
