import 'package:flutter/material.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/bottons.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/tap_bar_view.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/top_header.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                // top header
                const TopHeader(),
                const Text(
                  "More about Crealify!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                // bottons
                const TapBottons(),
                // tab bar
                const TapBarPage(),
                const TapViewPages(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
