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
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Customer',
                        style: AppTextStyle.bodyText.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Dropdown customer default customer',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Obx(() => Column(
                      children: controller.produkDibeli.map((produk) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [defaultBoxShadow1],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(produk.nama, style: AppTextStyle.bodyText),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (produk.jumlah > 1) {
                                        produk.jumlah--;
                                      } else {
                                        controller.produkDibeli.remove(produk);
                                      }
                                      controller.produkDibeli.refresh();
                                    },
                                  ),
                                  Text('${produk.jumlah}',
                                      style: AppTextStyle.bodyText),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      produk.jumlah++;
                                      controller.produkDibeli.refresh();
                                    },
                                  ),
                                ],
                              ),
                              Text('Rp ${produk.harga}',
                                  style: AppTextStyle.bodyText),
                            ],
                          ),
                        );
                      }).toList(),
                    )),

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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diskon',
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
                SizedBox(height: 10), // Tambahkan sedikit padding
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Metode Bayar',
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
