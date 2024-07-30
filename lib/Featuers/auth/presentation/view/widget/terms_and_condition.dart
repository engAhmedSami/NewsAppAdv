import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/custom_check_box.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isTearmAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChange: (value) {
            isTearmAccepted = value;
            widget.onChange(value);
            setState(() {});
          },
          isChecked: isTearmAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account, you agree to ',
                  style: AppStyles.styleboild13.copyWith(
                    color: const Color(0xff949d9e),
                  ),
                ),
                TextSpan(
                  text: 'the terms and conditions',
                  style: AppStyles.styleboild13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppStyles.styleboild13,
                ),
                TextSpan(
                  text: 'of our',
                  style: AppStyles.styleboild13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppStyles.styleboild13,
                ),
                TextSpan(
                  text: 'policy',
                  style: AppStyles.styleboild13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
