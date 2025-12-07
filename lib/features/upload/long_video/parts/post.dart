import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';
import 'package:youtube_clone/features/upload/long_video/parts/video.dart';

class Post extends ConsumerWidget {
  final VideoModel video;
  const Post({super.key, required this.video});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(anyUserDataProvider(video.userId));

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Video(video: video)),
        );

        // Add view counter
        FirebaseFirestore.instance
            .collection("videos")
            .doc(video.userId)
            .update({"views": FieldValue.increment(1)});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------
          // VIDEO THUMBNAIL
          // --------------------------------------------
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: video.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // --------------------------------------------
          // CHANNEL AVATAR + VIDEO TITLE + MORE BUTTON
          // --------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Channel avatar
              userAsync.when(
                data: (user) {
                  return CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: user.profilePic.isNotEmpty
                        ? CachedNetworkImageProvider(user.profilePic)
                        : null,
                    child: user.profilePic.isEmpty
                        ? const Icon(Icons.person, size: 20)
                        : null,
                  );
                },
                loading: () => const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                ),
                error: (_, __) => const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                ),
              ),

              const SizedBox(width: 8),

              // TITLE + views + time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video title
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Subtitle (username + views + time)
                    userAsync.when(
                      data: (user) {
                        return Text(
                          "${user.displayName} · "
                          "${video.views == 0 ? "No views" : "${video.views} views"} · "
                          "just now",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        );
                      },
                      loading: () => Text(
                        "Loading...",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      error: (_, __) => Text(
                        "${video.views} views · just now",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

              // More button
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
