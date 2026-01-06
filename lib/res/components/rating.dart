import 'package:flutter/material.dart';
import 'package:teglax_assignment/res/utils/colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    double clampedRating = rating.clamp(0.5, 5.0);

    int fullStars = clampedRating.floor();
    bool hasHalfStar = (clampedRating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    List<Widget> stars = [];

    // Full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: AppColors.amber));
    }

    // Half star
    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: AppColors.amber));
    }

    // Empty stars
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: AppColors.amber));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
