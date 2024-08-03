import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/verfied_email_view_body.dart';

class VerfiedEmailView extends StatelessWidget {
  const VerfiedEmailView({super.key});
  static const routeName = 'verify';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Verfied Email',
          textAlign: TextAlign.center,
          style: AppStyles.styleSemiBold24.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: const VerfiedEmailViewBody(),
    );
  }
}
