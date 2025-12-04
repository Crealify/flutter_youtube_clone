import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class UserChannelPage extends StatefulWidget {
  const UserChannelPage({super.key});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  bool haveVideos = false;
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
            haveVideos
                ? const SizedBox()
                : SizedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        child: const Text(
                          "No Videos",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
