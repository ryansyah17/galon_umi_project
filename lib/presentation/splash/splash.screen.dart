import 'package:flutter/material.dart';
import 'package:galon_umi_project/domain/core/assets/app_images.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/extensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/side-navbar');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.deviceHeight,
        width: context.deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    AppImages.imageSplash,
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
