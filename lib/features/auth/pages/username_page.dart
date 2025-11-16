import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/pages/flat_button.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  void validaeUsername() async {
    final usersMap = await FirebaseFirestore.instance.collection("user").get();
    final users = usersMap.docs.map((user) => user).toList();
    String? targetedUsername;

    for (var user in users) {
      if (usernameController.text == user.data()['username']) {
        targetedUsername = user.data()['username'];
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
                  key: formKey,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.verified_user_rounded),
                    suffixIconColor: Colors.green,

                    hintText: "Insert Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
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
                onPressed: () {},
                colour: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
