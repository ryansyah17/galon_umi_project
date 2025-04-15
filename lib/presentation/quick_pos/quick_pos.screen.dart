import 'package:flutter/material.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_title.dart';
import 'package:galon_umi_project/presentation/quick_pos/widgets/card_status_pemesanan.dart';
import 'package:galon_umi_project/presentation/quick_pos/widgets/temp_data_customer_pesan.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/constant/colors.dart';
import '../../infrastructure/theme/constant/text_style.dart';
import '../../infrastructure/theme/extensions/custom_appbar.dart';
import '../../infrastructure/theme/extensions/extensions.dart';
import '../../infrastructure/theme/extensions/format_date.dart';
import 'controllers/quick_pos.controller.dart';
import 'widgets/card_customer.dart';

class QuickPosScreen extends GetView<QuickPosController> {
  const QuickPosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: QuickPosController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.disabled,
        appBar: CustomAppBar(
          context: context,
          title: 'Quick POS',
          leading: false,
          height: 80,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    //left side
                    leftSide(context, controller),
                    SizedBox(width: 10),
                    //right side
                    centerSide(context, controller),
                    SizedBox(width: 10),
                    rightSide(context, controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftSide(BuildContext context, QuickPosController controller) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [defaultBoxShadow1],
        ),
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    'Data Pelanggan',
                    style: AppTextStyle.heading1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  // Search Customer
                  SizedBox(
                    height: 50,
                    child: TextField(
                      style: AppTextStyle.bodyText.copyWith(
                        color: AppColors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Cari Customer...',
                        hintStyle: AppTextStyle.bodyText.copyWith(
                          color: AppColors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.white,
                          ), // Border saat aktif
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.white,
                        ),
                      ),
                      onChanged: (value) {
                        controller.searchCustomer(value);
                      },
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          print(1);
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [defaultBoxShadow],
                          ),
                          child: Center(
                            child: Text(
                              'New Customer',
                              style: AppTextStyle.bodyText.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),

            // List Customer
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredCustomers.length,
                  itemBuilder: (context, index) {
                    final customer = controller.filteredCustomers[index];
                    return CardCustomer(
                        customer: customer, controller: controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget centerSide(BuildContext context, QuickPosController controller) {
    return Expanded(
      flex: 3,
      child: Container(
        height: context.deviceHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            titlePemesanan(context, controller),
            Expanded(
              child: TempDataCustomerPesan(controller: controller),
            ),
          ],
        ),
      ),
    );
  }

  Widget rightSide(BuildContext context, QuickPosController controller) {
    return Expanded(
      flex: 2,
      child: Container(
        height: context.deviceHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            CardTitle(title: 'Status Pemesanan', seeAll: false),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardStatusPemesanan();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titlePemesanan(BuildContext context, QuickPosController controller) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Form Pemesanan',
            style: AppTextStyle.heading1.copyWith(
              color: AppColors.white,
            ),
          ),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatTanggalV7(
                    DateTime.parse(controller.currentTime.value),
                  ),
                  style: AppTextStyle.bodyText.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  formatTanggal(DateTime.parse(controller.currentTime.value)),
                  style: AppTextStyle.bodyText.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  formatTanggalV6(DateTime.parse(controller.currentTime.value)),
                  style: AppTextStyle.bodyText.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
