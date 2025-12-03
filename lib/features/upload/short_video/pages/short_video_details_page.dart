import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/pages/flat_button.dart';

class ShortVideoDetailsPage extends StatefulWidget {
  const ShortVideoDetailsPage({super.key});

  @override
  State<ShortVideoDetailsPage> createState() => _ShortVideoDetailsPageState();
}

class _ShortVideoDetailsPageState extends State<ShortVideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final captionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Detials Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 20, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: captionController!,
                  decoration: InputDecoration(
                    hintText: "Write a Capiton.",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FlatButton(
                    text: "PUBLIDH",
                    onPressed: () {},
                    colour: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
