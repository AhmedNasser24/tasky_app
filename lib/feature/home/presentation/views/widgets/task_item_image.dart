import 'package:flutter/material.dart';
import 'custom_cached_network_image.dart';

class TaskItemImage extends StatelessWidget {
  const TaskItemImage(
    this.imageUrl, {
    super.key,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(imageUrl: imageUrl);
  }
}
