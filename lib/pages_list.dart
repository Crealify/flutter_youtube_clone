import 'package:flutter/cupertino.dart';
import 'package:youtube_clone/features/content/Long_video/long_video_screen.dart';
import 'package:youtube_clone/features/content/short_video/pages/short_video_page.dart';

List pages = [
  LongVideoScreen(),
  ShortVideoPage(),
  Center(child: Text("Upload ")),
  Center(child: Text("Search ")),
  Center(child: Text("Log out ")),
];
