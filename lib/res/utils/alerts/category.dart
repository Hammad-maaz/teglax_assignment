import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/res/utils/colors.dart';

class Alerts{
    void showCategoryDialog(BuildContext context, dynamic controller) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black.withValues(alpha: .8),
                  ),
                ),
                const SizedBox(height: 12),

                // Category List
                Expanded(
                  child: Obx(() {
                    return Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        itemCount: controller.categories.length + 1,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          String title;
                          bool isSelected;

                          if (index == 0) {
                            title = 'All';
                            isSelected =
                                controller.selectedCategory.value.isEmpty;
                          } else {
                            final category = controller.categories[index - 1];
                            title = category.name;
                            isSelected = controller.selectedCategory.value ==
                                category.slug;
                          }

                          return ListTile(
                            title: Text(
                              title,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : AppColors.black.withValues(alpha: .8),
                              ),
                            ),
                            trailing: isSelected
                                ? Icon(Icons.check,
                                    color: Theme.of(context).primaryColor)
                                : null,
                            onTap: () {
                              if (index == 0) {
                                controller.selectCategory(null);
                              } else {
                                controller.selectCategory(
                                    controller.categories[index - 1]);
                              }
                              Get.back();
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}