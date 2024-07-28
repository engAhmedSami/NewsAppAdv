import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class NewsAppText extends StatelessWidget {
  const NewsAppText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesNewsiconRemovebgPreview,
          height: 100,
        ),
        const SizedBox(width: 10),
        Text(
          'News',
          style:
              AppStyles.styleBold30.copyWith(color: AppColors.secondaryColor),
        ),
        const SizedBox(width: 5),
        const Text('Watch', style: AppStyles.styleBold30),
      ],
    );
  }
}
