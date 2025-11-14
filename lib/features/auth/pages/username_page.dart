import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/pages/flat_button.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

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
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.verified_user_rounded),
                  suffixIconColor: Colors.green,

                  hintText: "Insert Username",
                  border: const OutlineInputBorder(
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

            const Spacer(),
            const Padding(
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
