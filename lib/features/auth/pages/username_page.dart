// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:youtube_clone/features/auth/pages/flat_button.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;
  const UsernamePage({
    super.key,
    required this.displayName,
    required this.profilePic,
    required this.email,
  });

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  void validaeUsername() async {
    final usersMap = await FirebaseFirestore.instance.collection("users").get();
    final users = usersMap.docs.map((user) => user).toList();
    String? targetedUsername;

    for (var user in users) {
      if (usernameController.text == user.data()["username"]) {
        targetedUsername = user.data()["username"];
        isValidate = false;
        setState(() {});
      }
      if (usernameController.text != targetedUsername) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 14,
                vertical: 26,
              ),
              child: Text(
                "Enter the username",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Form(
                child: TextFormField(
                  onChanged: (username) {
                    validaeUsername();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username) {
                    return isValidate ? null : "Username already taken";
                  },
                  key: formKey,
                  controller: usernameController,
                  decoration: InputDecoration(
                    suffixIcon: isValidate
                        ? const Icon(Icons.verified_user_rounded)
                        : const Icon(Icons.cancel),
                    suffixIconColor: isValidate ? Colors.green : Colors.red,

                    hintText: "Insert Username",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, right: 15, left: 15),
              child: FlatButton(
                text: "CONTINUE",
                onPressed: () async {
                  isValidate
                      ? await ref
                            .read(userDataServiceProvider)
                            .addUserDataToFirestore(
                              displayName: widget.displayName,
                              username: usernameController.text,
                              email: widget.email,
                              profilePic: widget.profilePic,
                              description: "",
                              subscriptions: [],
                              videos: 0,
                              userId: '',
                              type: '',
                            )
                      : null;
                  // add user data inside databeas
                },
                colour: isValidate ? Colors.green : Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
