import 'package:flutter/material.dart';
import 'package:galon_umi_project/domain/entity/other/mock_customer_model.dart';
import 'package:galon_umi_project/presentation/quick_pos/controllers/quick_pos.controller.dart';

import '../../../infrastructure/theme/constant/colors.dart';
import '../../../infrastructure/theme/constant/text_style.dart';

class CardCustomer extends StatelessWidget {
  final Customer customer;
  final QuickPosController controller;
  const CardCustomer(
      {super.key, required this.customer, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name,
                        style: AppTextStyle.bodyText,
                      ),
                      Text(
                        customer.noHp,
                        style: AppTextStyle.subBodyText,
                      ),
                      Text(
                        'Riwayat : ${customer.riwayatPesanan}X Pemesanan',
                        style: AppTextStyle.subBodyText.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: 5,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.selectCustomer(customer);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
