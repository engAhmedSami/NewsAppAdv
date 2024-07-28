import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/have_an_account_widget.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/terms_and_condition.dart';
import 'package:newsapp/constants.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const NewsAppText(),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Full Name',
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xff949d9e),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndCondition(),
            const SizedBox(
              height: 30,
            ),
            CustomBotton(
              onPressed: () {},
              text: 'SignUp',
            ),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget()
          ],
        ),
      ),
    );
  }
}
