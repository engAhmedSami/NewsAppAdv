import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/otp_phone_view.dart';
import 'package:newsapp/constants.dart';

class PhoneSigninViewBody extends StatefulWidget {
  const PhoneSigninViewBody({super.key});

  @override
  PhoneSigninViewBodyState createState() => PhoneSigninViewBodyState();
}

class PhoneSigninViewBodyState extends State<PhoneSigninViewBody> {
  String countryCode = '+20';
  String countryFlag = '🇪🇬';
  final TextEditingController phoneController = TextEditingController();
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
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                Assets.imagesSigninPhone,
                height: 350,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 8, bottom: 14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: const CountryListThemeData(
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          textStyle: AppStyles.styleSemiBold16,
                        ),
                        onSelect: (Country country) {
                          setState(() {
                            countryCode = '+${country.phoneCode}';
                            countryFlag = country.flagEmoji;
                          });
                          log('Selected country: ${country.displayName}');
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          countryFlag,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          countryCode,
                          style: AppStyles.styleSemiBold20.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                ),
                controller: phoneController,
                hintText: 'Enter your phone number',
                textInputType: TextInputType.phone,
                onSaved: (value) {
                  phoneController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  } else if (value.length >= 12) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 90,
              ),
              CustomBotton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final phoneNumber = countryCode + phoneController.text;
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.pushNamed(context, OtpPhoneView.routeName,
                            arguments: verificationId);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: phoneNumber,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
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

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
