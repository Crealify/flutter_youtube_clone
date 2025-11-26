import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
