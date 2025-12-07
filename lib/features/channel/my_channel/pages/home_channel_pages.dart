//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/channel/users_channel/provider/channel_provider.dart';
import 'package:youtube_clone/features/upload/long_video/parts/post.dart';

class HomeChannelPages extends ConsumerWidget {
  const HomeChannelPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(
          eachChannelVideosProvider(FirebaseAuth.instance.currentUser!.uid),
        )
        .when(
          data: (videos) => videos.isEmpty
              ? const Center(
                  child: Text(
                    "No Video",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 4,
                    left: 4,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true, // 🔥 Important
                    physics: const ClampingScrollPhysics(), //
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 2,
                        ),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Post(video: videos[index]);
                    },
                  ),
                ),
          error: (_, __) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
