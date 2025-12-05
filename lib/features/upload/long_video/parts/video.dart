// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/screens/error_page.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/content/comment/comment_provider.dart';
import 'package:youtube_clone/features/content/comment/comment_sheet.dart';
import 'package:youtube_clone/features/upload/long_video/parts/post.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';
import 'package:youtube_clone/features/upload/long_video/video_repository.dart';
import 'package:youtube_clone/features/upload/long_video/widgets/first_video_comment.dart';
import 'package:youtube_clone/features/upload/long_video/widgets/video_externel_buttons.dart';

class Video extends ConsumerStatefulWidget {
  final VideoModel video;
  const Video({super.key, required this.video});

  @override
  ConsumerState<Video> createState() => _VideoState();
}

class _VideoState extends ConsumerState<Video> {
  bool isShowIcons = false;
  bool isPlaying = false;
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.vidoeUrl))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  toogleVideoPlayer() {
    if (_controller!.value.isPlaying) {
      //pause the video
      _controller!.pause();
      isPlaying = false;
      setState(() {});
    } else {
      //play the video
      _controller!.play();
      isPlaying = true;
      setState(() {});
    }
  }

  goBackward() {
    Duration position = _controller!.value.position;
    position = position - Duration(seconds: 1);
    _controller!.seekTo(position);
  }

  goFordward() {
    Duration position = _controller!.value.position;
    position = position + Duration(seconds: 1);
    _controller!.seekTo(position);
  }

  likeVideo() async {
    await ref
        .watch(longVideoProvider)
        .likeVideo(
          likes: widget.video.likes,
          videoId: widget.video.userId,
          currentUserId: FirebaseAuth.instance.currentUser!.uid,
        );
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<UserModel> user = ref.watch(
      anyUserDataProvider(widget.video.userId),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(176),
          child: _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: GestureDetector(
                    onTap: isShowIcons
                        ? () {
                            isShowIcons = false;
                            setState(() {});
                          }
                        : () {
                            isShowIcons = true;

                            setState(() {});
                          },
                    // onTap: () {
                    //   setState(() {
                    //     isShowIcons = !isShowIcons;
                    //   });
                    // },
                    child: Stack(
                      children: [
                        VideoPlayer(_controller!),

                        isShowIcons
                            ? Positioned(
                                left: 170,
                                top: 88,
                                child: GestureDetector(
                                  onTap: toogleVideoPlayer,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/play.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        isShowIcons
                            ? Positioned(
                                left: 40,
                                top: 88,
                                child: GestureDetector(
                                  onTap: goBackward,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/go_back_final.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),

                        isShowIcons
                            ? Positioned(
                                right: 40,
                                top: 88,
                                child: GestureDetector(
                                  onTap: goFordward,
                                  child: SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/images/go ahead final.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 7.5,
                            child: VideoProgressIndicator(
                              _controller!,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                playedColor: Colors.red,
                                bufferedColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 100),
                  child: Loader(),
                ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 4),
              child: Text(
                widget.video.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Text(
                      widget.video.views == 0
                          ? "No View"
                          : "${widget.video.views} views,",
                      style: const TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8),
                    child: Text(
                      "5 minutes ago",
                      style: const TextStyle(
                        fontSize: 13.4,
                        color: Color(0xff5F5F5F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 9, right: 9),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                    backgroundImage: CachedNetworkImageProvider(
                      user.value!.profilePic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      user.value!.displayName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, left: 6),
                    child: Text(
                      user.value!.subscriptions.isEmpty
                          ? "No Subscriptions"
                          : "${user.value!.subscriptions.length} Subscriptions",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FlatButton(
                        text: "Subscribe",
                        onPressed: () {},
                        colour: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 10.5, right: 9),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      decoration: const BoxDecoration(
                        color: softBlueGreyBackGround,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),

                      //also we can use steambuilder and make changes see on real time
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: likeVideo,
                            child: Icon(
                              Icons.thumb_up,
                              size: 15.5,
                              color:
                                  widget.video.likes.contains(
                                    FirebaseAuth.instance.currentUser!.uid,
                                  )
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("${widget.video.likes.length}"),
                          const SizedBox(width: 19),
                          const Icon(Icons.thumb_down, size: 15.5),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButton(
                        text: "Share",
                        iconData: Icons.share,
                      ),
                    ),
                    const VideoExtraButton(
                      text: "Remix",
                      iconData: Icons.analytics_outlined,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 9, right: 9),
                      child: VideoExtraButton(
                        text: "Download",
                        iconData: Icons.download,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Comment Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CommentSheet(video: widget.video),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  height: 80,
                  width: 200,
                  // child: Consumer(
                  //   builder: (context, ref, child) {
                  //     final AsyncValue<List<CommentModel>> comments = ref.watch(
                  //       commentsProvider(widget.video.videoId),
                  //     );
                  //     if (comments.value!.isEmpty) {
                  //       return const SizedBox();
                  //     }
                  //     return VideoFirstComment(
                  //       comments: comments.value!,
                  //       user: user.value!,
                  //     );
                  //   },
                  // ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final commentsAsync = ref.watch(
                        commentsProvider(widget.video.videoId),
                      );

                      return commentsAsync.when(
                        loading: () =>
                            const SizedBox(), // show nothing while loading

                        error: (err, stack) =>
                            const SizedBox(), // avoid UI crash

                        data: (comments) {
                          if (comments.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 10, top: 12),
                              child: Text(
                                "Be the first to comment...",
                                style: TextStyle(fontSize: 13.5),
                              ),
                            );
                          }

                          return VideoFirstComment(
                            comments: comments,
                            user: user.value!,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 10, left: 5),
            //   child: Text(
            //     "Recommanded Video",
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("videos")
                    .where("videoId", isNotEqualTo: widget.video.videoId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loader();
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return ErrorPage();
                  }
                  // You can customize the widget below as needed
                  final videosMap = snapshot.data!.docs;
                  final videos = videosMap
                      .map((doc) => VideoModel.fromMap(doc.data()))
                      .toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Post(video: videos[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
