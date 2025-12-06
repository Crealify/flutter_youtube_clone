import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscribeChannelProvider = Provider(
  (ref) => Subscribe(firestore: FirebaseFirestore.instance),
);

class Subscribe {
  FirebaseFirestore? firestore;
  Subscribe({this.firestore});

  Future<void> subscribeChannel({
    required userId,
    required currentUserId,
    required subscriptions,
  }) async {
    if (subscriptions.contains([currentUserId])) {
      await firestore!.collection("user").doc(userId).update({
        "supscriptions": FieldValue.arrayRemove([currentUserId]),
      });
    }
    if (!subscriptions.contains([currentUserId])) {
      await firestore!.collection("user").doc(userId).update({
        "supscriptions": FieldValue.arrayUnion([currentUserId]),
      });
    }
  }
}
