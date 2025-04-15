import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';

import '../../../infrastructure/theme/constant/text_style.dart';

class CardMenu extends StatelessWidget {
  final String title;
  final String image;
  const CardMenu({super.key, required this.title, required this.image});

  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: image == '' ? AppColors.white : AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: image == ''
                  ? Container()
                  : Image.asset(
                      image,
                    ),
            ),
          ),
          Text(title, style: AppTextStyle.bodyText),
        ],
      ),
    );
  }
}
