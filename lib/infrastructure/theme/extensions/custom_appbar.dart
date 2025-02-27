import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  final bool leading;
  final double height;

  const CustomAppBar(
      {super.key,
      required this.context,
      required this.title,
      required this.leading,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: leading,
      title: Row(
        children: [
          SizedBox(width: 10), // Spasi antara logo dan teks
          Text(
            title, // Judul AppBar
            style: AppTextStyle.heading1.copyWith(
              color: AppColors.white,
            ), // Menggunakan tema teks
          ),
        ],
      ),
      centerTitle: false, // Judul tidak di tengah
      actions: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jhon Doe',
                style: AppTextStyle.bodyText.copyWith(
                  color: AppColors.white,
                ), // Menggunakan tema teks,
              ),
              Text(
                'Kasir',
                style: AppTextStyle.subBodyText.copyWith(
                  color: AppColors.white,
                ), // Menggunakan tema teks,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height); // Tinggi default AppBar
}
