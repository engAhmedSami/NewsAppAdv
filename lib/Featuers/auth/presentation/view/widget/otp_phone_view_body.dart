import 'package:flutter/material.dart';

import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/constants.dart';

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
              // SvgPicture.asset(
              //   Assets.imagesOtp,
              //   height: 350,
              // ),
              const SizedBox(height: 50),
              // OtpTextField(
              //   enabledBorderColor: AppColors.secondaryColor,
              //   fieldWidth: 50,
              //   numberOfFields: 6,
              //   showFieldAsBox: true,
              //   onCodeChanged: (String code) {
              //     log("code $code");
              //     // if (code.length == 6)
              //     //   Navigator.pushNamed(context, VerfiedEmailView.routeName);

              //     // setState(() {
              //     //   _code = code;
              //     // });
              //   },
              //   onSubmit: (String verificationCode) {
              //     log("verificationCode $verificationCode");
              //   },
              // ),
              // const SizedBox(
              //   height: 90,
              // ),
              CustomBotton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
