import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/methods.dart';
import 'package:uuid/uuid.dart';
import 'package:youtube_clone/features/upload/long_video/video_repository.dart';

class VideoDetailsPage extends ConsumerStatefulWidget {
  final File? video;
  const VideoDetailsPage({super.key, this.video});

  @override
  ConsumerState<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends ConsumerState<VideoDetailsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  File? image;
  bool isThumbnailIsSelected = false;
  String randomNumber = const Uuid().v4();
  String videoId = const Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter the title",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),

              SizedBox(height: 5),
              TextField(
                controller: titleController,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: "Enter the Title",
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Enter the Descriptions",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 5),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                maxLength: 5000,
                decoration: InputDecoration(
                  hintText: "Enter the Descriptions",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              //
              // Select Thumbnails
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      image = await pickImage();
                      isThumbnailIsSelected = true;
                      setState(() {});
                    },
                    child: const Text(
                      "SELECT THUMBNAILS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              isThumbnailIsSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Image.file(
                        image!,
                        cacheHeight: 160,
                        cacheWidth: 400,
                      ),
                    )
                  : const SizedBox(),

              isThumbnailIsSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            // publish video
                            String thumbnail = await uploadToCloudinary(
                              image!,
                              "youtube_clone_images",
                            );
                            String videoUrl = await uploadToCloudinary(
                              widget.video!,
                              "youtube_clone_videos",
                            );

                            ref
                                .watch(longVideoProvider)
                                .uploadvideoToFirestore(
                                  videoUrl: videoUrl,
                                  thumbnail: thumbnail,
                                  title: titleController.text,
                                  videoId: videoId,
                                  datePublished: DateTime.now(),
                                  userId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                  views: '',
                                  like: [],
                                  type: '',
                                );
                          },

                          // onPressed: () async {
                          //   // publish video
                          //   String thumbnail = await putFileInStorage(
                          //     image,
                          //     randomNumber,
                          //     "image",
                          //   );
                          //   String videoUrl = await putFileInStorage(
                          //     widget.video,
                          //     randomNumber,
                          //     "vidoe",
                          //   );

                          //   ref
                          //       .watch(longVideoProvider)
                          //       .uploadvideoToFirestore(
                          //         videoUrl: videoUrl,
                          //         thumbnail: thumbnail,
                          //         title: titleController.text,
                          //         videoId: videoId,
                          //         datePublished: DateTime.now(),
                          //         userId:
                          //             FirebaseAuth.instance.currentUser!.uid,
                          //         views: '',
                          //         like: [],
                          //         type: '',
                          //       );
                          // },
                          child: const Text(
                            "PUBLISH",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
