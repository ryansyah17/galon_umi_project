import 'package:flutter/material.dart';

import '../../../infrastructure/theme/constant/colors.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final bool index;
  final VoidCallback onTap;
  final Color color;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.index,
    required this.onTap,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 25.0,
              height: 25.0,
              child: Image.asset(
                iconPath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
