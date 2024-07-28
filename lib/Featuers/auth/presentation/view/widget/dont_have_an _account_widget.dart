import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "Don't have an account? ",
              style: AppStyles.styleboild13.copyWith(
                color: const Color(0xff949d9e),
              )),
          TextSpan(
            text: 'Create an account',
            style: AppStyles.styleboild13.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
