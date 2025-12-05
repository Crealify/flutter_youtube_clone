import 'package:flutter/cupertino.dart';
import 'package:youtube_clone/features/content/Long_video/long_video_screen.dart';
import 'package:youtube_clone/features/content/short_video/pages/short_video_page.dart';
import 'package:youtube_clone/features/search/pages/search_screen.dart';

List pages = [
  LongVideoScreen(),
  ShortVideoPage(),
  Center(child: Text("Upload ")),

  SearchScreen(),

  // LogoutPage(),
];
