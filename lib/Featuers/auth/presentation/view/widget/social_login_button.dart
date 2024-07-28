import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.tital,
      required this.onPressed});
  final String image;
  final String tital;
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
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            tital,
            textAlign: TextAlign.center,
            style: AppStyles.styleSemiBold16,
          ),
        ),
      ),
    );
  }
}
