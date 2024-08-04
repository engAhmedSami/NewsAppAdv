// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
// import 'package:newsapp/Core/utils/app_colors.dart';
// import 'package:newsapp/Core/utils/app_images.dart';
// import 'package:newsapp/Core/utils/app_styles.dart';
// import 'package:newsapp/Core/widget/custom_botton.dart';
// import 'package:newsapp/Core/widget/custom_text_field.dart';
// import 'package:newsapp/Core/widget/news_app_text.dart';
// import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/forgot_password_view.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/dont_have_an_account_widget.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/or_divider.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/password_field.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/remember_me.dart';
// import 'package:newsapp/Featuers/auth/presentation/view/widget/social_login_button.dart';
// import 'package:newsapp/constants.dart';
// import 'dart:io';

// class SigninViewBody extends StatefulWidget {
//   const SigninViewBody({super.key});

//   @override
//   State<SigninViewBody> createState() => _SigninViewBodyState();
// }

// class _SigninViewBodyState extends State<SigninViewBody> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   bool isRemembermeClicked = false;
//   UserPrefs userPrefs = UserPrefs();

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedCredentials();
//   }

//   Future<void> _loadSavedCredentials() async {
//     emailController.text = await userPrefs.readCache('email');
//     passwordController.text = await userPrefs.readCache('password');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
//         child: Form(
//           key: formKey,
//           autovalidateMode: autovalidateMode,
//           child: Column(
//             children: [
//               const SizedBox(height: 24),
//               const NewsAppText(),
//               const SizedBox(height: 16),
//               CustomTextFormField(
//                 controller: emailController,
//                 hintText: 'Email',
//                 textInputType: TextInputType.emailAddress,
//                 onSaved: (value) {
//                   emailController.text = value!;
//                 },
//               ),
//               const SizedBox(height: 16),
//               PasswordField(
//                 controller: passwordController,
//                 onSaved: (value) {
//                   passwordController.text = value!;
//                 },
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, ForgotPasswordView.routName);
//                     },
//                     child: Text(
//                       'Forget Password',
//                       style: AppStyles.styleMedium16.copyWith(
//                         color: AppColors.secondaryColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               RememberMe(
//                 onChange: (value) {
//                   setState(() {
//                     isRemembermeClicked = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 33),
//               CustomBotton(
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     if (isRemembermeClicked) {
//                       await userPrefs.writeCache(
//                           key: 'email', value: emailController.text);
//                       await userPrefs.writeCache(
//                           key: 'password', value: passwordController.text);
//                     }
//                     await userPrefs.setRememberMe(isRemembermeClicked);
//                     await userPrefs.setLoggedIn(true);
//                     context.read<SigninCubit>().signIn(
//                           emailController.text,
//                           passwordController.text,
//                         );
//                   } else {
//                     setState(() {
//                       autovalidateMode = AutovalidateMode.always;
//                     });
//                   }
//                 },
//                 text: 'Login',
//               ),
//               const SizedBox(height: 33),
//               const DontHaveAnAccountWidget(),
//               const SizedBox(height: 33),
//               const OrDivider(),
//               const SizedBox(height: 16),
//               SocialLoginButton(
//                 image: Assets.imagesGoogel,
//                 tital: 'Login with Google',
//                 onPressed: () async {
//                   await userPrefs.setLoggedIn(true);

//                   context.read<SigninCubit>().signInWithGoogle();
//                 },
//               ),
//               const SizedBox(height: 16),
//               Platform.isIOS
//                   ? Column(
//                       children: [
//                         SocialLoginButton(
//                           image: Assets.imagesApple,
//                           tital: 'Login with Apple',
//                           onPressed: () {},
//                         ),
//                         const SizedBox(height: 16),
//                       ],
//                     )
//                   : const SizedBox(),
//               SocialLoginButton(
//                 image: Assets.imagesFacebook,
//                 tital: 'Login with Facebook',
//                 onPressed: () async {
//                   await userPrefs.setLoggedIn(true);

// ignore_for_file: use_build_context_synchronously

//                   context.read<SigninCubit>().signInWithFacebook();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/forgot_password_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/dont_have_an_account_widget.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/or_divider.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/password_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/remember_me.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/social_login_button.dart';
import 'package:newsapp/constants.dart';
import 'dart:io';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRemembermeClicked = false;
  UserPrefs userPrefs = UserPrefs();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    emailController.text = await userPrefs.readCache('email');
    passwordController.text = await userPrefs.readCache('password');
  }

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
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  emailController.text = value!;
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPasswordView.routName);
                    },
                    child: Text(
                      'Forget Password',
                      style: AppStyles.styleMedium16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              RememberMe(
                onChange: (value) {
                  setState(() {
                    isRemembermeClicked = value;
                  });
                },
              ),
              const SizedBox(height: 33),
              CustomBotton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isRemembermeClicked) {
                      await userPrefs.writeCache(
                          key: 'email', value: emailController.text);
                      await userPrefs.writeCache(
                          key: 'password', value: passwordController.text);
                    }
                    await userPrefs.setRememberMe(isRemembermeClicked);
                    await userPrefs.setLoggedIn(true);
                    context.read<SigninCubit>().signIn(
                          emailController.text,
                          passwordController.text,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'Login',
              ),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                image: Assets.imagesGoogel,
                tital: 'Login with Google',
                onPressed: () async {
                  await userPrefs.setLoggedIn(true);

                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          image: Assets.imagesApple,
                          tital: 'Login with Apple',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox(),
              SocialLoginButton(
                image: Assets.imagesFacebook,
                tital: 'Login with Facebook',
                onPressed: () async {
                  await userPrefs.setLoggedIn(true);

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
