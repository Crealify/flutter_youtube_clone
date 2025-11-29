import 'package:flutter/material.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter the title",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),

              SizedBox(height: 5),
              TextField(
                maxLength: 100,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Enter the Title",
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Enter the Descriptions",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 5),
              TextField(
                maxLines: 10,
                maxLength: 5000,
                decoration: InputDecoration(
                  hintText: "Enter the Descriptions",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              //
              // Select Thumbnails
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "SELECT THUMBNAILS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
