import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

class TapBottons extends StatelessWidget {
  const TapBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,

          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              color: softBlueGreyBackGround,
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
        ),
        Expanded(
          child: ImageButton(
            image: "pen.png",
            onPressed: () {},
            haveColor: true,
          ),
        ),
        Expanded(
          child: ImageButton(
            image: "time-watched.png",
            onPressed: () {},
            haveColor: true,
          ),
        ),
      ],
    );
  }
}
