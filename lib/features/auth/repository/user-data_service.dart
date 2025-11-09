// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataService({
    required this.auth,
    required this.firestore,
  });
  addUserDataToFirestore() async {

    
  }

}
