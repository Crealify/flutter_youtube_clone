import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/pages/flat_button.dart';

class UserChannelPage extends StatelessWidget {
  const UserChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/flutter background.png"),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 10, top: 20),
              child: Row(
                children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.grey),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anil Bhattarai",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "@Crealify",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                            children: [
                              TextSpan(text: "No Subscriptions |"),

                              TextSpan(text: "| No Videos"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: FlatButton(
                text: "SUBSCRIBE",
                onPressed: () {},
                colour: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
