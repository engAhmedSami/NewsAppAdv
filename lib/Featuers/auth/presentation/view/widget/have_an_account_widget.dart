import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/under_line.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: AppStyles.styleSemiBold16.copyWith(
            color: const Color(0xff949d9e),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: UnderLine(
            child: Text(
              ' Sign in',
              style: AppStyles.styleSemiBold16.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
