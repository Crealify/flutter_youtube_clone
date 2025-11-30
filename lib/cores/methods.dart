// // ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:youtube_clone/features/upload/long_video/video_details_page.dart';

// void showErrorSnackBar(String message, context) =>
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
//     );
// Future<File> pickImage() async {
//   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
//   File image = File(file!.path);
//   if (image != null) {
//     return image;
//   }
// }

// Future pickVideo(context) async {
//   XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
//   File video = File(file!.path);
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) {
//         return VideoDetailsPage(video: video);
//       },
//     ),
//   );
// }

// Future<String> putFileInStorage(file, number, fileType) async {
//   final ref = FirebaseStorage.instance.ref().child("$fileType/$number");
//   final upload = ref.putFile(file);
//   final snapshot = await upload;
//   String downloadUrl = await snapshot.ref.getDownloadURL();
//   return downloadUrl;
// }

// // ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_clone/features/upload/long_video/video_details_page.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );

Future<File> pickImage() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  File image = File(file!.path);
  return image;
}

Future pickVideo(context) async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return VideoDetailsPage(video: video);
      },
    ),
  );
}

Future<String> uploadToCloudinary(File file, String folder) async {
  try {
    final cloudinary = CloudinaryPublic('dsytr6bft', folder, cache: false);

    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        file.path,
        resourceType: folder == 'youtube_clone_videos'
            ? CloudinaryResourceType.Video
            : CloudinaryResourceType.Image,
      ),
    );

    return response.secureUrl;
  } catch (e) {
    throw Exception('Failed to upload file: $e');
  }
}
