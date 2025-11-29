import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/methods.dart';

class VideoDetailsPage extends StatefulWidget {
  const VideoDetailsPage({super.key});

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  File? image;
  bool isThumbnailIsSelected = false;

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
                    onPressed: () {
                      image = pickImage();
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
                  ? Image.file(image!, cacheHeight: 160, cacheWidth: 400)
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
                          onPressed: () {},
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
