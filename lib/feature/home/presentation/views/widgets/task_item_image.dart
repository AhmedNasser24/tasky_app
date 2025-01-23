import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class TaskItemImage extends StatelessWidget {
  const TaskItemImage(
    this.imageUrl, {
    super.key,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
          Assets.imagesTask,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
