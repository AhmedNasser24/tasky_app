import 'package:flutter/cupertino.dart';
import '../../../../../core/helper/format_date.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class TaskItemDate extends StatelessWidget {
  const TaskItemDate({super.key,this.date });
  final String? date ;
  @override
  Widget build(BuildContext context) {
    return  Text(
      date == null ? '30/5/2024' : formatDate(date!),
      style: AppStyles.regular12,
    );
  }

   
}

