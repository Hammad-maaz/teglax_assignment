import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/models/product_details_model/product_details_model.dart';
import 'package:teglax_assignment/res/utils/colors.dart';
import 'package:teglax_assignment/res/widgets/carousel_slider_widget.dart';
import 'package:teglax_assignment/res/widgets/rating.dart';
import 'package:teglax_assignment/view_model/product_details_view_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final int productId = Get.arguments;
    final ProductDetailsViewModel productDetails =
        Get.find<ProductDetailsViewModel>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.black.withValues(alpha: .1),
          title: const Text('Details'),
        ),
        body: FutureBuilder<ProductDetailsModel?>(
            future: productDetails.fetchProductDetails(productId),
            builder: (context, snap) {
              /// Fetching Data
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              /// Error While Fetching Data
              else if (snap.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snap.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              /// No Data Found
              else if (!snap.hasData || snap.data == null) {
                return const Center(
                  child: Text('No Data Found'),
                );
              }

              /// Data Fetched Successfully
              else {
                final data = snap.data!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSliderWidget(images: data.images),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${data.title} (${data.category})',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                RatingWidget(rating: data.rating),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              data.description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
