import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/models/product_details_model/product_details_model.dart';
import 'package:teglax_assignment/res/utils/colors.dart';
import 'package:teglax_assignment/res/components/carousel_slider_widget.dart';
import 'package:teglax_assignment/res/components/rating.dart';
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
                    style: TextStyle(color: AppColors.red),
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
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: .1),
                              blurRadius: 8.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CarouselSliderWidget(images: data.images),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and Rating
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${data.title} (${data.category})',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          AppColors.black.withValues(alpha: .8),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                RatingWidget(rating: data.rating),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Price
                            Text(
                              '\$${data.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.green,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Description in a card
                            Card(
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  data.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        AppColors.black.withValues(alpha: .7),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              }
            }));
  }
}
