import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class GenerateQrCode extends StatelessWidget {
  const GenerateQrCode({super.key, required this.taskId});
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.all(26),    
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: PrettyQrView.data(data: taskId),
            )
          ],
        ),
      ),
    );
  }
}
