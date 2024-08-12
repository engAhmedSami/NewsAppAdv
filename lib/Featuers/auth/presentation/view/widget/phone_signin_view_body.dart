import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/otp_phone_body.dart';
import 'package:newsapp/constants.dart';

class PhoneSigninViewBody extends StatelessWidget {
  const PhoneSigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
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
              controller: TextEditingController(),
              hintText: 'Enter your phone number',
              textInputType: TextInputType.phone,
              onSaved: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }

                if (value.length < 10) {
                  return 'Please enter a valid phone number';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 90,
            ),
            CustomBotton(
              onPressed: () {
                Navigator.pushNamed(context, OtpPhoneBody.routeName);
              },
              text: 'Sign In',
            )
          ],
        ),
      ),
    );
  }
}
