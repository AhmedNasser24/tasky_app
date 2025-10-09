import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/user_info_model.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class SelectedExperienceTextFormField extends StatefulWidget {
  const SelectedExperienceTextFormField(
    this.userInfoModel, {
    super.key,
  });
  final UserInfoModel userInfoModel;

  @override
  State<SelectedExperienceTextFormField> createState() =>
      _SelectedExperienceTextFormFieldState();
}

class _SelectedExperienceTextFormFieldState
    extends State<SelectedExperienceTextFormField> {
  String selectExperience = 'Choose experience Level';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onTap: () {
        _showAccountKindDialog(context);
      },
      readOnly: true,
      controller: TextEditingController(text: selectExperience),
      suffixIcon: const Icon(Icons.arrow_drop_down, color: AppColor.greyColor),
      // suffix: _showPopUpMenu(),
      validator: (_) {
        if (selectExperience == 'Choose experience Level') {
          return "Choose experience Level";
        }
        widget.userInfoModel.experienceLevel = selectExperience;
        return null;
      },
    );
  }

  List<String> experience = ["fresh" , "junior" , "midLevel" , "senior"];
  void _showAccountKindDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < experience.length; i++)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectExperience = experience[i];
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(child: Text(experience[i], style: AppStyles.semibold14)),
                      ),
                    ),
                    i != experience.length - 1
                        ? const Divider(
                            height: 0,
                            thickness: 0.3, color: AppColor.primaryColor,
                            
                            )
                        : const SizedBox(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
