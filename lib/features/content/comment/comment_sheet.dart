import 'package:flutter/material.dart';

class CommentSheet extends StatelessWidget {
  const CommentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.expand_circle_down_outlined),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.grey.shade400),
            child: const Text(
              "Remember to keep comments respectful and follow out community and guideliences",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Row(
              children: [
                CircleAvatar(radius: 18, backgroundColor: Colors.grey),
                const SizedBox(width: 10),
                const SizedBox(
                  height: 45,
                  width: 274,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Add a comment",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send, color: Colors.green, size: 36),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
