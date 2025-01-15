import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/create_app_bar.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/image_form_field.dart';

class CreateViewBody extends StatefulWidget {
  const CreateViewBody({super.key});

  @override
  State<CreateViewBody> createState() => _CreateViewBodyState();
}

class _CreateViewBodyState extends State<CreateViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CreateAppBar(),
          Gap(24),
          ImageFormField(),
          Gap(16),
          
        ],
      ),
      
    );
  }
}