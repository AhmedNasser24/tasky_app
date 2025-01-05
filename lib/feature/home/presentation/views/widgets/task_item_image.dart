
import 'package:flutter/material.dart';

class TaskItemImage extends StatelessWidget {
  const TaskItemImage(
    this.image, {
    super.key,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.fill,
    );
  }
}
