import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

import '../../../../../core/helper/image_picker.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';

class ImageFormField extends StatefulWidget {
  const ImageFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;
  @override
  State<ImageFormField> createState() => _ImageFormFieldState();
}

class _ImageFormFieldState extends State<ImageFormField> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: image == null
          ? GestureDetector(
              onTap: () async {
                image = await pickImageFromGallery();
                if (image != null) {
                  log("image picked successfully");
                }
                setState(() {});
              },
              child: DottedBorder(
                color: AppColor.primaryColor,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesImageIcon),
                    const Gap(8),
                    const Text("Add Img", style: AppStyles.medium19),
                  ],
                ),
              ),
            )
          : Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.file(image!, fit: BoxFit.fill),
                    ),
                  ),
                  const Gap(8),
                  IconButton(
                    onPressed: () {
                      image = null;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColor.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
