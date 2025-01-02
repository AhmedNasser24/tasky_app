import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/user_info_model.dart';
import 'custom_textformfield.dart';

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
        widget.userInfoModel.experience = selectExperience;
        return null;
      },
    );
  }

  List<String> experience = ['Fresh', 'Junior', 'Senior'];
  void _showAccountKindDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < experience.length; i++)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: GestureDetector(
                        child: Text(experience[i], style: AppStyles.semibold14),
                        onTap: () {
                          setState(() {
                            selectExperience = experience[i];
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    i != experience.length - 1
                        ? const Divider(
                            thickness: 0.3, color: AppColor.primaryColor)
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
