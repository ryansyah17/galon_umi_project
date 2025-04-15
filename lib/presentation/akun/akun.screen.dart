import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/akun.controller.dart';

class AkunScreen extends GetView<AkunController> {
  const AkunScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AkunScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AkunScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
