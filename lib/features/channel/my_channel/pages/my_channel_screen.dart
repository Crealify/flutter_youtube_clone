import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
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

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,

                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: softBlueGreyBackGround,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Manage Videos",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                // fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          image: "pen.png",
                          onPressed: () {},
                          haveColor: true,
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          image: "time-watched.png",
                          onPressed: () {},
                          haveColor: true,
                        ),
                      ),
                    ],
                  ),
                ),

                // tab bar
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
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
                ),
                Expanded(
                  child: const TabBarView(
                    children: [
                      Center(child: Text("Home")),
                      Center(child: Text("Videos")),
                      Center(child: Text("Shorts")),
                      Center(child: Text("Community")),
                      Center(child: Text("Playlists")),
                      Center(child: Text("Channels")),
                      Center(child: Text("About")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
