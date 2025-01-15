import 'package:flutter/material.dart';

import 'widgets/create_view_body.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});
  static const routeName = '/createView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CreateViewBody(),
      ),
    );
  }
}
