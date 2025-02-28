import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/custom_appbar.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: 'Beranda',
          leading: false,
          height: 80,
        ),
      ),
    );
  }
}
