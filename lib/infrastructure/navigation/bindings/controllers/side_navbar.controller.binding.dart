import 'package:get/get.dart';

import '../../../../presentation/side_navbar/controllers/side_navbar.controller.dart';

class SideNavbarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideNavbarController>(
      () => SideNavbarController(),
    );
  }
}
