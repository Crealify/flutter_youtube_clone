import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class SearchChannelTile extends StatelessWidget {
  const SearchChannelTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.blueGrey, radius: 40),

              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anil Bhattarai",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "@crealify",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                    ),
                    Text(
                      "No Subscribers",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    text: "Subscribe",
                    onPressed: () {},
                    colour: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: FlatButton(
                    text: "View Channel",
                    onPressed: () {},
                    colour: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
