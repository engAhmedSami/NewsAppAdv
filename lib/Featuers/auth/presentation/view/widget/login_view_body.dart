import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/dont_have_an_account_widget.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/or_divider.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/social_login_button.dart';
import 'package:newsapp/constants.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget Password',
                  style: AppStyles.styleSemiBold16.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            CustomBotton(onPressed: () {}, text: 'Login'),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesGoogel,
              tital: 'Login with Google',
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesApple,
              tital: 'Login with Apple',
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesFacebook,
              tital: 'Login with Facebook',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
