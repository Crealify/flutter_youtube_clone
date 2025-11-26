import 'package:flutter/material.dart';

class TapBarPage extends StatelessWidget {
  const TapBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return // tab bar
    const Padding(
      padding:  EdgeInsets.only(top: 14),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(top: 12),
        indicatorColor: Colors.red,
        tabs: [
          Text("Home"),
          Text("Videos"),
          Text("Shorts"),
          Text("Community"),
          Text("Playlists"),
          Text("Channels"),
          Text("About"),
        ],
      ),
    );
  }
}
