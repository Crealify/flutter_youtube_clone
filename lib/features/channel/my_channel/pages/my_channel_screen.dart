import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  // backgroundImage: AssetImage('assets/images/youtube-logo.jpg'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 4),
                child: Text(
                  'Crealify',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.blueGrey),
                    children: [
                      TextSpan(text: ' @Crealify •'),
                      TextSpan(text: ' 0 Subscriber •'),
                      TextSpan(text: ' 0 Videos'),
                    ],
                  ),
                ),
              ),
              const Text(
                "More about Crealify!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),

              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Manage Videos",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ImageButton(
                    image: "pen.png",
                    onPressed: () {},
                    haveColor: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
