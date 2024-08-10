import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/custom_check_box.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
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
          width: 4,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Remember me',
                style: AppStyles.styleMedium14.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
