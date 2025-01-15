import 'package:flutter/material.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "Add task",
    );
  }
}
