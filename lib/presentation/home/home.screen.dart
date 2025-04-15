import 'package:flutter/material.dart';
import 'package:galon_umi_project/domain/core/assets/app_images.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/custom_appbar.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/extensions.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_jadwal_pengantaran.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_menu.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_title.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_topselling.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/constant/text_style.dart';
import 'controllers/home.controller.dart';
import 'widgets/card_report.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            spacing: 10,
            children: [
              //left side
              Expanded(
                flex: 4,
                child: Container(
                  height: context.deviceHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: leftSide(context, controller),
                ),
              ),
              //center side
              Expanded(
                flex: 3,
                child: Container(
                  height: context.deviceHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: centerSide(context, controller),
                ),
              ),
              // right side
              Expanded(
                flex: 3,
                child: Container(
                  height: context.deviceHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: rightSide(context, controller),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftSide(BuildContext context, HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Infoo
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  children: [
                    Text(
                      'Omset Hari Ini',
                      style: AppTextStyle.heading1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rp 123.000',
                      style: AppTextStyle.heading1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                CardReport(
                  icon: Icons.article,
                  persentase: '12%',
                  title: "Orders",
                  total: 121,
                ),
              ],
            ),
          ),
          //List Menu
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardMenu(
                image: AppImages.iconReport,
                title: 'Pengeluaran',
              ),
              CardMenu(
                image: AppImages.iconReport,
                title: 'Services',
              ),
              CardMenu(
                image: AppImages.iconReport,
                title: 'Neraca',
              ),
              CardMenu(
                image: AppImages.iconReport,
                title: 'Pelanggan',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardMenu(
                image: AppImages.iconReport,
                title: 'Gaji',
              ),
              CardMenu(
                image: AppImages.iconReport,
                title: 'Peminjaman',
              ),
              CardMenu(
                image: '',
                title: '',
              ),
              CardMenu(
                image: '',
                title: '',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget centerSide(BuildContext context, HomeController controller) {
    return Container(
      height: context.deviceHeight,
      decoration: BoxDecoration(
        color: AppColors.disabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CardTitle(
            title: 'Jadwal Pengantaran Hari Ini',
            seeAll: false,
          ),
          Expanded(
            child: CardJadwalPengantaran(),
          ),
        ],
      ),
    );
  }

  Widget rightSide(BuildContext context, HomeController controller) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                CardTitle(title: 'Jadwal Pengantaran Besok', seeAll: false),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CardTopSelling();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                CardTitle(title: 'Top Customer', seeAll: true),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CardTopSelling();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
