// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/upload/comments/comment_model.dart';

// class VideoFirstComment extends StatelessWidget {
//   final List<CommentModel> comments;
//   final UserModel user;

//   const VideoFirstComment({
//     super.key,
//     required this.comments,
//     required this.user,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               "Comment",
//               maxLines: 2,
//               style: const TextStyle(fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(width: 5),
//             Text("${comments.length}"),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 7.5),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 14,
//                 backgroundColor: Colors.grey,
//                 backgroundImage: CachedNetworkImageProvider(user.profilePic),
//               ),
//               const SizedBox(width: 7),
//               SizedBox(
//                 width: 280,
//                 child: Text(
//                   // "First comment on the video",
//                   comments[0].commentText,
//                   maxLines: 2,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 13.5,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
class VideoFirstComment extends StatelessWidget {
  final List<CommentModel> comments;
  final UserModel user;

  const VideoFirstComment({
    super.key,
    required this.comments,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Comment",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5),
            Text("${comments.length}"),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: CachedNetworkImageProvider(user.profilePic),
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                comments[0].commentText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
