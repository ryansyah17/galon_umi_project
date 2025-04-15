import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/laporan.controller.dart';

class LaporanScreen extends GetView<LaporanController> {
  const LaporanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaporanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
