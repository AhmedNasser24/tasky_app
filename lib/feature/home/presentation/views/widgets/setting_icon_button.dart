import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(Assets.imagesSettingIcon),
    );
    // return PopupMenuButton<String>(
    //   padding: const EdgeInsets.all(0),
    //   borderRadius: BorderRadius.circular(20),
    //   position: PopupMenuPosition.under,
    //   icon: SvgPicture.asset(Assets.imagesSettingIcon),
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //   ),
    //   color: Colors.white,
    //   offset: const Offset(1, 4),
    //   shadowColor: const Color(0x30000000),
    //   onSelected: (String choice) {
    //     // Handle the selected option
    //     if (choice == 'Edit') {
    //       showSnackBar(context, 'Edit selected');
    //     } else if (choice == 'Delete') {
    //       showSnackBar(context, 'Delete selected');
    //     }
    //   },
    //   itemBuilder: (BuildContext context) {
    //     return <PopupMenuEntry<String>>[
    //       const PopupMenuItem<String>(
    //           value: 'Edit', child: Text('Edit', style: AppStyles.medium16)),
    //       const PopupMenuDivider(height: 1 , ),
    //       PopupMenuItem<String>(
    //         value: 'Delete',
    //         child: Text('Delete',
    //             style: AppStyles.medium16
    //                 .copyWith(color: const Color(0xffFF7D53))),
    //       ),
    //     ];
    //   },
    // );
  }
}
