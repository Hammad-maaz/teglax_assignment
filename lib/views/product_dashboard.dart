import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/res/utils/alerts/category.dart';
import 'package:teglax_assignment/res/utils/colors.dart';
import 'package:teglax_assignment/res/widgets/product.dart';
import 'package:teglax_assignment/res/widgets/text_form_field.dart';
import 'package:teglax_assignment/view_model/product_view_model.dart';

class Dashboard extends GetView<ProductViewModel> {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppColors.black.withValues(alpha: .1),
        // actions: [
        //   Obx(() {
        //     return IconButton(
        //       icon: Icon(
        //         controller.isDarkMode.value
        //             ? Icons.dark_mode
        //             : Icons.light_mode,
        //       ),
        //       onPressed: () {
        //         controller.isDarkMode.value = !controller.isDarkMode.value;

        //         if (controller.isDarkMode.value) {
        //           Get.changeTheme(ThemeData.dark());
        //         } else {
        //           Get.changeTheme(ThemeData.light());
        //         }
        //       },
        //     );
        //   }),
        // ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: buildTextFormField(
                    controller: controller.searchController.value,
                    onChanged: (value) => controller.searchController.refresh(),
                    hintText: "Search Here..."),
              ),
              GestureDetector(
                onTap: () => Alerts().showCategoryDialog(context, controller),
                child: Icon(
                  Icons.filter_alt_outlined,
                  size: 35,
                  color: AppColors.black.withValues(alpha: .6),
                ),
              )
            ],
          ),
          Expanded(
            child: Obx(() {
              final query =
                  controller.searchController.value.text.toLowerCase();
              final filtered = controller.productList.where((p) {
                return query.isEmpty || p.title.toLowerCase().contains(query);
              }).toList();

              if (filtered.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final data = filtered[index];
                  return product(
                    title: data.title,
                    thumbnail: data.thumbnail,
                    price: data.price,
                    id: data.id,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
