import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('SplashScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
