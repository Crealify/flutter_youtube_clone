import 'package:flutter/material.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/home_channel_pages.dart';

class TapViewPages extends StatelessWidget {
  const TapViewPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        HomeChannelPages(), // ← VIDEO GRID APPEARS HERE

        Center(child: Text("Videos")),
        Center(child: Text("Shorts")),
        Center(child: Text("Community")),
        Center(child: Text("Playlists")),
        Center(child: Text("Channels")),
        Center(child: Text("About")),
      ],
    );
  }
}
