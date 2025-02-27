import 'package:flutter/material.dart';
import 'package:galon_umi_project/domain/core/assets/app_images.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/extensions.dart';
import 'package:galon_umi_project/presentation/home/home.screen.dart';

import 'package:get/get.dart';

import 'controllers/side_navbar.controller.dart';
import 'widgets/nav_item.dart';

class SideNavbarScreen extends GetView<SideNavbarController> {
  SideNavbarScreen({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const Text('Widgets 1'),
    const Text('Widgets 2'),
    const Text('Widgets 3'),
    const Text('Widgets 4')
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SideNavbarController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: context.deviceHeight - 20.0,
                  child: ColoredBox(
                    color: AppColors.primary,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Image.asset(
                                AppImages.logoWater,
                                width: 75.0,
                                height: 75.0,
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: ColoredBox(
                                      color: controller.selectedIndex.value == 0
                                          ? AppColors.disabled.withOpacity(0.4)
                                          : Colors.transparent,
                                      child: NavItem(
                                        iconPath: AppImages.iconHome,
                                        index:
                                            controller.selectedIndex.value == 0,
                                        onTap: () => controller.onItemTapped(0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: ColoredBox(
                                      color: controller.selectedIndex.value == 1
                                          ? AppColors.disabled.withOpacity(0.4)
                                          : Colors.transparent,
                                      child: NavItem(
                                        iconPath: AppImages.iconHome,
                                        index:
                                            controller.selectedIndex.value == 1,
                                        onTap: () => controller.onItemTapped(1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: ColoredBox(
                                      color: controller.selectedIndex.value == 2
                                          ? AppColors.disabled.withOpacity(0.4)
                                          : Colors.transparent,
                                      child: NavItem(
                                        iconPath: AppImages.iconHome,
                                        index:
                                            controller.selectedIndex.value == 2,
                                        onTap: () => controller.onItemTapped(2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  flex: 10,
                  child: _pages[controller.selectedIndex.value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
