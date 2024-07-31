import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/dont_have_an_account_widget.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/or_divider.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/password_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/social_login_button.dart';
import 'package:newsapp/constants.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const NewsAppText(),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomBotton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signIn(
                            email,
                            password,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Login'),
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
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
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
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
