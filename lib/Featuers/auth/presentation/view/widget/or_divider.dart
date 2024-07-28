import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.secondaryColor,
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Text('Or', style: AppStyles.styleMedium16),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: Divider(color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}
