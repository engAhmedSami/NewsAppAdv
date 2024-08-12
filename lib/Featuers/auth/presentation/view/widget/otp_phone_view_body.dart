import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Featuers/home/presentation/views/home_view.dart';
import 'package:newsapp/constants.dart';

class OtpPhoneViewBody extends StatelessWidget {
  const OtpPhoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            const SizedBox(height: 30),
            SvgPicture.asset(
              Assets.imagesOtp,
              height: 350,
            ),
            const SizedBox(height: 50),
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
              },
            ),
            const SizedBox(
              height: 90,
            ),
            CustomBotton(
              onPressed: () {
                Navigator.pushNamed(context, HomeView.routeName);
              },
              text: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
