// import 'package:cloudinary_public/cloudinary_public.dart';

// final cloudinary = CloudinaryPublic(
//   'Cloud Name',
//   'YOUR_UPLOAD_PRESET:youtube_clone_images',
//   'YOUR_UPLOAD_PRESET:youtube_clone_videos',
//   '	API Secret: ',
//   'API KEY: '

//   cache: false,
// );

// //upload image
//  Future<String> uploadImage(File imageFile) async {
//   try {
//     CloudinaryResponse response = await cloudinary.uploadFile(
//       CloudinaryFile.fromFile(
//         imageFile.path,
//         resourceType: CloudinaryResourceType.Image,
//       ),
//     );
//     return response.secureUrl; // This URL is for display/download
//   } catch (e) {
//     throw Exception("Image upload failed: $e");
//   }
// }
// //upload video
// Future<String> uploadVideo(File videoFile) async {
//   try {
//     CloudinaryResponse response = await cloudinary.uploadFile(
//       CloudinaryFile.fromFile(
//         videoFile.path,
//         resourceType: CloudinaryResourceType.Video,
//       ),
//     );
//     return response.secureUrl;
//   } catch (e) {
//     throw Exception("Video upload failed: $e");
//   }
// }
