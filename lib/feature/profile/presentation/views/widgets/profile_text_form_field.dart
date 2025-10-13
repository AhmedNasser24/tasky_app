import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_styles.dart';
import 'copy_icon_button.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField(
      {super.key,
      required this.title,
      required this.subTitle,
      this.copy = false});
  final String title, subTitle;
  final bool copy;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.medium15
                      .copyWith(color: const Color(0x662F2F2F)),
                      overflow: TextOverflow.ellipsis,                      
                ),
                const Gap(4),
                Text(
                  subTitle,
                  style:
                      AppStyles.bold18.copyWith(color: const Color(0x992F2F2F)),
                      overflow: TextOverflow.ellipsis,                      
                ),
              ],
            ),
          ),
          copy ? CopyIconButton(textToCopy: subTitle) : const Gap(0),
        ],
      ),
    );
  }
}
