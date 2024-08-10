import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/under_line.dart';
import 'package:newsapp/Featuers/auth/presentation/view/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ? ",
            style: AppStyles.styleboild13.copyWith(
              color: const Color(0xff949d9e),
            )),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, SignupView.routeName);
          },
          child: UnderLine(
            child: Text(
              'Create an account',
              style: AppStyles.styleboild13.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
