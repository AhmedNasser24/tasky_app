import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

import '../../../../../core/helper/image_picker.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../home/presentation/views/widgets/custom_cached_network_image.dart';

class ImageFormField extends StatefulWidget {
  const ImageFormField(this.taskModel, {super.key});
  final TaskModel taskModel;
  @override
  State<ImageFormField> createState() => _ImageFormFieldState();
}

class _ImageFormFieldState extends State<ImageFormField> {

  @override
  Widget build(BuildContext context) {
    // return ShowImageFile(onPressedonDeleteIcon: (){}) ;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: widget.taskModel.image != null
          ? ShowImageComeFromNetwork(
              widget: widget,
              onPressedonDeleteIcon: () {
                widget.taskModel.image = null;
                setState(() {});
              },
            )
          : AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: widget.taskModel.imageFile == null
                  ? AddImageButton(
                      onTap: () async {
                        // isLoading = true;
                        // setState(() {});
                        widget.taskModel.imageFile =
                            await pickImageFromGallery();
                        // isLoading = false;
                        setState(() {});
                      },
                    )
                  : ShowImageFile(
                      taskModel: widget.taskModel,
                      onPressedonDeleteIcon: () {
                        widget.taskModel.imageFile = null;
                        setState(() {});
                      },
                    ),
            ),
    );
  }
}

class ShowImageComeFromNetwork extends StatelessWidget {
  const ShowImageComeFromNetwork({
    super.key,
    required this.widget,
    required this.onPressedonDeleteIcon,
  });

  final ImageFormField widget;
  final void Function() onPressedonDeleteIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCachedNetworkImage(imageUrl: widget.taskModel.image!),
          const Gap(5),
          IconButton(
            onPressed: onPressedonDeleteIcon,
            icon: const Icon(
              Icons.delete,
              color: AppColor.primaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: AppColor.primaryColor,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesImageIcon),
            const Gap(8),
            const Text("Add Img", style: AppStyles.medium19),
          ],
        ),
      ),
    );
  }
}

class ShowImageFile extends StatelessWidget {
  const ShowImageFile({
    super.key,
    required this.onPressedonDeleteIcon,
    required this.taskModel,
  });
  final void Function() onPressedonDeleteIcon;
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 340, maxWidth: 340),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // image: DecorationImage(
                //   image: FileImage( widget.taskModel.imageFile! ),
                // )
              ),
              child: Image.file(
                taskModel.imageFile!,
                fit: BoxFit.fill,
              ),
              // child: Image.asset(Assets.imagesTaskySplash, fit: BoxFit.fill),
            ),
          ),
          const Gap(8),
          IconButton(
            onPressed: onPressedonDeleteIcon,
            icon: const Icon(
              Icons.delete,
              color: AppColor.primaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
