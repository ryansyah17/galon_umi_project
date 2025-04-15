import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/text_style.dart';
import 'package:get/get.dart';
import 'package:galon_umi_project/presentation/quick_pos/controllers/quick_pos.controller.dart';

import '../../../infrastructure/theme/extensions/extensions.dart';

class TempDataCustomerPesan extends StatelessWidget {
  final QuickPosController controller;
  const TempDataCustomerPesan({super.key, required this.controller});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data Customer', style: AppTextStyle.heading1),
                SizedBox(height: 10),
                _buildCustomerInfo(
                    'Nama : ', () => controller.selectedCustomer.value.name,
                    isPrimary: true),
                _buildCustomerInfo('Nomor HandPhone : ',
                    () => controller.selectedCustomer.value.noHp),
                _buildCustomerInfo(
                    'Riwayat pesanan : ',
                    () =>
                        '${controller.selectedCustomer.value.riwayatPesanan}X pesanan',
                    isPrimary: true,
                    isBottom: true),
                SizedBox(height: 10),
                _buildCounterInput(
                    'Isi Ulang',
                    controller.count,
                    controller.increment,
                    controller.decrement,
                    '7.000',
                    controller.setValue),
                SizedBox(height: 10),
                _buildCounterInput(
                    'Beli Galon',
                    controller.jumlahGalon,
                    controller.increment,
                    controller.decrement,
                    '54.000',
                    controller.setValue),
                SizedBox(height: 10), // Tambahkan sedikit padding
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.black,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Diskon',
                //       style: AppTextStyle.bodyText,
                //     ),
                //     SizedBox(
                //       width: 200,
                //       height: 40,
                //       child: TextField(
                //         textAlign: TextAlign.center,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.all(10),
                //           border: OutlineInputBorder(),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10), // Tambahkan sedikit padding
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Metode Bayar',
                //       style: AppTextStyle.bodyText,
                //     ),
                //     SizedBox(
                //       width: 200,
                //       height: 40,
                //       child: TextField(
                //         textAlign: TextAlign.center,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.all(10),
                //           border: OutlineInputBorder(),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10), // Tambahkan sedikit padding

                Text(
                  '*Jika total bayar tidak diinput, maka status pemesanan akan otomatis menjadi "Belum Lunas"',
                  style: AppTextStyle.subBodyText.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 30), // Tambahkan sedikit padding
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Bayar',
                      style: AppTextStyle.bodyText,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print(1);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 120, vertical: 5),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [defaultBoxShadow],
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: AppTextStyle.bodyText.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfo(String label, String Function() valueProvider,
      {bool isPrimary = false, bool isBottom = false}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : AppColors.white,
        borderRadius: isBottom
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: AppTextStyle.bodyText.copyWith(
                  color: isPrimary ? AppColors.white : AppColors.black)),
          Obx(() => Text(valueProvider(),
              style: AppTextStyle.bodyText.copyWith(
                  color: isPrimary ? AppColors.white : AppColors.black))),
        ],
      ),
    );
  }

  Widget _buildCounterInput(
      String label,
      RxInt counter,
      VoidCallback onIncrement,
      VoidCallback onDecrement,
      String harga,
      Function(String) onChanged) {
    return Row(
      children: [
        Expanded(child: Text(label, style: AppTextStyle.bodyText)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: const Icon(Icons.remove, size: 30),
                onPressed: onDecrement),
            SizedBox(
              width: 60,
              height: 40,
              child: Obx(() {
                final controller = TextEditingController(text: counter.string);
                return TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                  ),
                );
              }),
            ),
            IconButton(
                icon: const Icon(Icons.add, size: 30), onPressed: onIncrement),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.disabled,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Rp$harga/satuan',
                style: AppTextStyle.bodyText.copyWith(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
