// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';

import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/users_channel/provider/channel_provider.dart';

class UserChannelPage extends StatefulWidget {
  final String userId;
  const UserChannelPage({super.key, required this.userId});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  //  tmporary used
  bool haveVideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return ref
                    .watch(anyUserDataProvider(widget.userId))
                    .when(
                      data: (user) => Column(
                        children: [
                          Image.asset("assets/images/flutter background.png"),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 10,
                              top: 20,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: CachedNetworkImageProvider(
                                    user.profilePic,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.displayName,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        user.username,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${user.subscriptions.length} subscriptionsc ",
                                            ),

                                            TextSpan(
                                              text: "${user.videos} videos ",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: FlatButton(
                                text: "SUBSCRIBE",
                                onPressed: () {},
                                colour: Colors.black,
                              ),
                            ),
                          ),
                          // haveVideos,
                          // ? const SizedBox()
                          // : SizedBox(
                          //     child: Center(
                          //       child: Padding(
                          //         padding: EdgeInsets.only(
                          //           top:
                          //               MediaQuery.sizeOf(context).height *
                          //               0.2,
                          //         ),
                          //         child: const Text(
                          //           "No Videos",
                          //           style: TextStyle(
                          //             fontSize: 24,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                        ],
                      ),
                      error: (error, stackTrace) => const ErrorPage(),
                      loading: () => Loader(),
                    );
              },
            ),

            // second consumer widget
            Consumer(
              builder: (context, ref, child) {
                return ref
                    .watch(eachChannelVideosProvider(widget.userId))
                    .when(
                      data: (data) => Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        child: const Text(
                          "No Videos",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      error: (error, stackTrace) => const ErrorPage(),
                      loading: () => const Loader(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
