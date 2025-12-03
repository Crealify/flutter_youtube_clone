import 'package:flutter/material.dart';

class ShortVideoDetailsPage extends StatelessWidget {
  const ShortVideoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsetsGeometry.only(top: 20),
          child: Column(children: [
            
          ]),
        ),
      ),
    );
  }
}
