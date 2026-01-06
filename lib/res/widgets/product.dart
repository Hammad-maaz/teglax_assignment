import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';
import 'package:teglax_assignment/res/utils/colors.dart';

Widget product(
    {required String title,
    required String thumbnail,
    required double price,
    required int id}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.black.withValues(alpha: .1),
        ),
      ),
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
      leading: CircleAvatar(
          backgroundColor: AppColors.black.withValues(alpha: .1),
          backgroundImage: NetworkImage(thumbnail)),
      trailing: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Get.toNamed(RoutesNames.productDetails, arguments: id);
      },
    ),
  );
}
