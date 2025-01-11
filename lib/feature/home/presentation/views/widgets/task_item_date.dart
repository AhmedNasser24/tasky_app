import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_styles.dart';

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

    String formatDate(String dateString) {
    // Parse the date string into a DateTime object
    DateTime parsedDate = DateTime.parse(dateString);

    // Format the DateTime into "31/12/2024"
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

    return formattedDate;
  }
}

