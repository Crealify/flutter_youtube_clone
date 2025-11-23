import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Image image;
  final VoidCallback onPressed;
  final bool haveColor;

  const ImageButton(
    this.image, {
    Key? key,
    required this.onPressed,
    this.haveColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: image,
      color: haveColor ? Colors.black : null,
      onPressed: onPressed,
    );
  }
}
