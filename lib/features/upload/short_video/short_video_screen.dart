// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_editor/video_editor.dart';
import 'package:youtube_clone/features/upload/short_video/widget/trim_slinder.dart';

class ShortVideoScreen extends StatefulWidget {
  final File shortVideo;
  const ShortVideoScreen({super.key, required this.shortVideo});

  @override
  State<ShortVideoScreen> createState() => _ShortVideoScreenState();
}

class _ShortVideoScreenState extends State<ShortVideoScreen> {
  // docs batw rakheko
  VideoEditorController? editorController;

  @override
  void initState() {
    //
    super.initState();
    editorController = VideoEditorController.file(
      widget.shortVideo,
      minDuration: const Duration(seconds: 3),
      maxDuration: const Duration(seconds: 60),
    );
    editorController!
        .initialize(aspectRatio: 4 / 3.6)
        .then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: editorController!.initialized
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.zoom_out_map_outlined),
                          ),
                          CircleAvatar(radius: 18),
                        ],
                      ),
                    ),

                    CropGridViewer.preview(controller: editorController!),

                    // editor cut aauxa
                    MyTrimSlider(controller: editorController!, height: 45),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("DONE"),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
