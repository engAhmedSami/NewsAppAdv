import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';
import 'package:newsapp/Featuers/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/have_an_account_widget.dart';
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
  late String email, userName, password;
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
                  userName = value!;
                },
                hintText: 'Full Name',
                textInputType: TextInputType.name,
              ),
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
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: const Icon(
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email, password, userName);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'SignUp',
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
