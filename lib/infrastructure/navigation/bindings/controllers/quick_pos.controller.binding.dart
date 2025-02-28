import 'package:get/get.dart';

import '../../../../presentation/quick_pos/controllers/quick_pos.controller.dart';

class QuickPosControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuickPosController>(
      () => QuickPosController(),
    );
  }
}
