import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
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

                // tav bar
                const TapBarPage(),
                const TapBarView(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
