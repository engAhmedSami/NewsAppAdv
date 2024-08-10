import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class PhoneLoginButton extends StatelessWidget {
  const PhoneLoginButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.secondaryColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: const ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: Icon(
            FontAwesomeIcons.phoneVolume,
            size: 20,
            color: AppColors.secondaryColor,
          ),
          title: Text(
            'Login with your Phone',
            textAlign: TextAlign.center,
            style: AppStyles.styleSemiBold16,
          ),
        ),
      ),
    );
  }
}
