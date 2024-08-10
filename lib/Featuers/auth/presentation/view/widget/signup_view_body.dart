import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/have_an_account_widget.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/password_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/terms_and_condition.dart';
import 'package:newsapp/constants.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password, confirmPassword;
  late bool isTermsAccepted = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                controller: TextEditingController(),
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'Full Name',
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: TextEditingController(),
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                hintText: 'Password',
                controller: passwordController,
                onSaved: (value) {
                  password = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  if (!RegExp(r'(?=.*?[!@#$%^&*(),.?":{}|<>])')
                      .hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
                onSaved: (value) {
                  confirmPassword = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TermsAndCondition(
                onChange: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 140),
              CustomBotton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAccepted) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      failuerTopSnackBar(
                        context,
                        'Please accept the terms and conditions',
                      );
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'SignUp',
              ),
              const SizedBox(height: 16),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
