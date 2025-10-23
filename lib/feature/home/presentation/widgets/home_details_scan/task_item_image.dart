import 'package:flutter/material.dart';

import 'custom_cached_network_image.dart';

class TaskItemImage extends StatelessWidget {
  const TaskItemImage(
    this.imageUrl, {
    super.key,
    this.fromApi = true,
  });
  final String imageUrl;
  final bool fromApi;
  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(imageUrl: imageUrl, fromApi: fromApi);
  }
}
