
import 'package:flutter/material.dart';

class TaskItemImage extends StatelessWidget {
  const TaskItemImage(
    this.image, {
    super.key,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
