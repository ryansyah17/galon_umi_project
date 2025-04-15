import 'package:flutter/material.dart';

import '../../../infrastructure/theme/constant/colors.dart';
import '../../../infrastructure/theme/constant/text_style.dart';
import '../../../infrastructure/theme/extensions/extensions.dart';

class CardReport extends StatelessWidget {
  final String title;
  final int total;
  final String persentase;
  final IconData icon;
  const CardReport({
    super.key,
    required this.icon,
    required this.title,
    required this.total,
    required this.persentase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [defaultBoxShadow1],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                icon,
                color: AppColors.black,
              ),
              Text(
                title,
                style: AppTextStyle.bodyText.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            total.toString(),
            style: AppTextStyle.bodyText.copyWith(
              fontSize: 20,
            ),
          ),
          Row(
            spacing: 5,
            children: [
              Icon(
                Icons.arrow_upward,
                color: AppColors.green,
                size: 20,
              ),
              Text(
                persentase,
                style: AppTextStyle.bodyText.copyWith(
                  color: AppColors.green,
                ),
              ),
              Text(
                'from last month',
                style: AppTextStyle.subBodyText.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
