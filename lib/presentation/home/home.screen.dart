import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/text_style.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/custom_appbar.dart';
import 'package:galon_umi_project/infrastructure/theme/extensions/extensions.dart';
import 'package:galon_umi_project/presentation/home/widgets/card_customer.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/constant/colors.dart';
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              //left side
              leftSide(context, controller),

              //right side
              rightSide(context, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftSide(BuildContext context, HomeController controller) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
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

  Widget rightSide(BuildContext context, HomeController controller) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Pemesanan Galon',
              style: AppTextStyle.heading1,
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                'Customer: ${controller.selectedCustomer.value.name}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Jumlah Galon',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                controller.jumlahGalon.value = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.placeOrder();
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
