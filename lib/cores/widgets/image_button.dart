import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Image image;
  final VoidCallback onPressed;
  final bool haveColor;

  const ImageButton(
    this.image, {
    super.key,
    required this.onPressed,
    this.haveColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: image,
      color: haveColor ? Colors.black : null,
      onPressed: onPressed,
    );
  }
}
