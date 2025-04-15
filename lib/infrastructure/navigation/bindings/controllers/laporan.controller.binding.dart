import 'package:get/get.dart';

import '../../../../presentation/laporan/controllers/laporan.controller.dart';

class LaporanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanController>(
      () => LaporanController(),
    );
  }
}
