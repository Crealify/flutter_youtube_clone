import 'package:flutter/material.dart';
import 'package:youtube_clone/features/channel/my_channel/pages/home_channel_pages.dart';

class TapBarViewPages extends StatelessWidget {
  const TapBarViewPages({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        HomeChannelPages(),
        Center(child: Text("Videos Page")),
        Center(child: Text("Shorts Page")),
        Center(child: Text("Community Page")),
        Center(child: Text("Playlists Page")),
        Center(child: Text("Channels Page")),
        Center(child: Text("About Page")),
      ],
    );
  }
}
