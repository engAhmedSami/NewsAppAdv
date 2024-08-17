import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:newsapp/Core/utils/app_colors.dart';

class NewsTileFade extends StatelessWidget {
  const NewsTileFade({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Shimmer.fromColors(
            baseColor: AppColors.secondaryColor.withOpacity(0.1),
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              color: Colors.grey[300],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Shimmer.fromColors(
          baseColor: AppColors.secondaryColor.withOpacity(0.1),
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.secondaryColor.withOpacity(0.1),
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 4),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          color: AppColors.secondaryColor,
          height: BorderSide.strokeAlignCenter,
          thickness: 1.5,
        ),
        const SizedBox(height: 5),
        const Divider(
          color: AppColors.secondaryColor,
          height: BorderSide.strokeAlignCenter,
          thickness: 1.5,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
