import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/constants.dart';
import 'package:pinput/pinput.dart';

class OtpPhoneViewBody extends StatefulWidget {
  const OtpPhoneViewBody({super.key});

  @override
  State<OtpPhoneViewBody> createState() => _OtpPhoneViewBodyState();
}

class _OtpPhoneViewBodyState extends State<OtpPhoneViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              SvgPicture.asset(
                Assets.imagesOtp,
                height: 350,
              ),
              const SizedBox(height: 50),
              Pinput(
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter OTP';
                  }
                  return null;
                },
                autofocus: true,
                onChanged: (value) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
              ),
              const SizedBox(
                height: 55,
              ),
              CustomBotton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
                text: 'Sign In',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Didn\'t receive code ?',
                style: AppStyles.styleMedium14
                    .copyWith(color: AppColors.secondaryColor),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend',
                  style: AppStyles.styleSemiBold16
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
