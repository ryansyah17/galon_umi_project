import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/colors.dart';

double defaultMargin = 24;
double designHeightPhone = 844;
double designWidthPhone = 390;

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}

double getX({
  required double x,
  required BuildContext context,
}) {
  return x / designWidthPhone * MediaQuery.of(context).size.width;
}

double getY({
  required double y,
  required BuildContext context,
}) {
  return y / designHeightPhone * MediaQuery.of(context).size.height;
}

double getXFont({
  required double x,
  required BuildContext context,
}) {
  return x / designWidthPhone * context.deviceWidth;
}

double getYFont({
  required double y,
  required BuildContext context,
}) {
  return y / designHeightPhone * context.deviceHeight;
}

double getLineHeight({required double fontSize, required double lineHight}) {
  return lineHight / fontSize;
}

BoxShadow defaultBoxShadow = BoxShadow(
  blurRadius: 5,
  spreadRadius: 3,
  color: Colors.grey.shade300,
);
BoxShadow defaultBoxShadow1 = BoxShadow(
  blurRadius: 2,
  spreadRadius: 1,
  color: Colors.grey.shade300,
);

SizedBox getSizedBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    height: getY(y: size, context: context),
  );
}

SizedBox getWidthBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    width: getX(x: size, context: context),
  );
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url,
      forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
}

void showLoading() {
  Get.dialog(
    Center(
        child: SpinKitCircle(
      color: AppColors.primary,
    )),
    barrierDismissible: false,
  );
}

void hideLoading() {
  Get.back();
}

Widget loading({required Color color}) {
  return SpinKitCircle(color: color);
}

void showSnackbar({
  required String title,
  required String deskripsi,
  required Color color,
}) {
  Get.snackbar(
    title,
    deskripsi,
    colorText: Colors.white,
    backgroundColor: color,
    icon: const Icon(Icons.warning, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}

String removeHtmlTags(String htmlString) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}

// CachedNetworkImage imageNetwork(
//     BuildContext context, String image, double widht, double height) {
//   return CachedNetworkImage(
//     imageUrl: image,
//     width: getY(y: widht, context: context),
//     height: getY(y: height, context: context),
//     fit: BoxFit.cover,
//     placeholder: (context, url) => SpinKitCircle(color: AppColors.neonBlue),
//     errorWidget: (context, url, error) => Image.asset(AppImages.billiardSatu),
//   );
// }

// CachedNetworkImage imageNetworkV2(
//   BuildContext context,
//   String image,
// ) {
//   return CachedNetworkImage(
//     imageUrl: image,
//     fit: BoxFit.cover,
//     placeholder: (context, url) => SpinKitCircle(color: AppColors.neonBlue),
//     errorWidget: (context, url, error) => Image.asset(AppImages.billiardSatu),
//   );
// }

Widget loadingShow(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget noData(
  double height,
  BuildContext context,
) {
  return SingleChildScrollView(
    child: SizedBox(
      width: double.infinity,
      height: getY(y: height, context: context),
      child: Image.asset('assets/images/no-data.png'),
    ),
  );
}

String convertMinutesToTime(int totalMinutes) {
  int jam = totalMinutes ~/ 60; // Hitung jam
  int menit = totalMinutes % 60; // Hitung sisa menit
  return '$jam jam $menit menit'; // Format output
}
