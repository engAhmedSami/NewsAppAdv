import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/constants.dart';

class OtpPhoneBody extends StatelessWidget {
  const OtpPhoneBody({super.key});
  static const routeName = 'OtpPhoneBody';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        context,
        tital: 'Otp Phone',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.imagesOtp,
              ),
              const SizedBox(height: 24),
              OtpTextField(
                enabledBorderColor: AppColors.secondaryColor,
                fieldWidth: 50,
                numberOfFields: 6,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  log("code $code");
                  // if (code.length == 6)
                  //   Navigator.pushNamed(context, VerfiedEmailView.routeName);

                  // setState(() {
                  //   _code = code;
                  // });
                },
                onSubmit: (String verificationCode) {
                  log("verificationCode $verificationCode");
                  Navigator.pushNamed(context, VerfiedEmailView.routeName);
                },
              )

              // CustomTextFormField(
              //   controller: TextEditingController(),
              //   hintText: 'Enter your code',
              //   onSaved: (value) {},
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your code';
              //     }

              //     return null;
              //   },
              //   textInputType: TextInputType.number,
              // ),
              ,
              const SizedBox(
                height: 40,
              ),
              CustomBotton(
                onPressed: () {},
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
