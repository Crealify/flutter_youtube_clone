import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscribeChannelProvider = Provider(
  (ref) => Subscribe(firestore: FirebaseFirestore.instance),
);

class Subscribe {
  FirebaseFirestore? firestore;
  Subscribe({this.firestore});

 
  Future<void> subscribeChannel({
    required String userId, // channel user id
    required String currentUserId, // current logged in user id
    required List<String> subscriptions,
  }) async {
    if (subscriptions.contains(currentUserId)) {
      // Unsubscribe
      await firestore!.collection("user").doc(userId).update({
        "subscriptions": FieldValue.arrayRemove([currentUserId]),
      });
    } else {
      // Subscribe
      await firestore!.collection("user").doc(userId).update({
        "subscriptions": FieldValue.arrayUnion([currentUserId]),
      });
    }
  }
}