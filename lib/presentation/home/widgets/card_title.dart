import 'package:flutter/material.dart';

import '../../../infrastructure/theme/constant/colors.dart';
import '../../../infrastructure/theme/constant/text_style.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final bool seeAll;
  const CardTitle({super.key, required this.title, required this.seeAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.heading1.copyWith(
              color: AppColors.white,
            ),
          ),
          seeAll == true
              ? Text(
                  'See All',
                  style: AppTextStyle.bodyText.copyWith(
                    color: AppColors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
