import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/under_line.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'By creating an account, you agree to ',
                    style: AppStyles.styleboild13.copyWith(
                      color: const Color(0xff949d9e),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: UnderLine(
                      child: Text(
                        'the terms ',
                        style: AppStyles.styleboild13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: UnderLine(
                  child: Text(
                    'the terms and conditions of our policy',
                    style: AppStyles.styleboild13.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// }import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:newsapp/Core/utils/app_colors.dart';
// import 'package:newsapp/Core/utils/app_styles.dart';
// import 'package:newsapp/Core/widget/under_line.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/custom_check_box.dart';

// class TermsAndCondition extends StatefulWidget {
//   const TermsAndCondition({super.key, required this.onChange});
//   final ValueChanged<bool> onChange;

//   @override
//   State<TermsAndCondition> createState() => _TermsAndConditionState();
// }

// class _TermsAndConditionState extends State<TermsAndCondition> {
//   bool isTearmAccepted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomCheckBox(
//           onChange: (value) {
//             isTearmAccepted = value;
//             widget.onChange(value);
//             setState(() {});
//           },
//           isChecked: isTearmAccepted,
//         ),
//         const SizedBox(
//           width: 8,
//         ),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: AppStyles.styleboild13.copyWith(
//                 color: const Color(0xff949d9e),
//               ),
//               children: [
//                 const TextSpan(
//                   text: 'By creating an account, you agree to ',
//                 ),
//                 WidgetSpan(
//                   child: InkWell(
//                     onTap: () {
//                       // Handle terms tap
//                     },
//                     child: UnderLine(
//                       child: Text(
//                         'the terms and conditions of our policy ',
//                         style: AppStyles.styleboild13.copyWith(
//                           color: AppColors.secondaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
