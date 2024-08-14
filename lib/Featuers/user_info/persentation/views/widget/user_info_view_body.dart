// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/show_snck_bar.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Featuers/user_info/persentation/save_info_cubit/profile_cubit.dart';
import 'package:newsapp/constants.dart';

class UserInfoViewBody extends StatefulWidget {
  const UserInfoViewBody({super.key});

  @override
  State<UserInfoViewBody> createState() => _UserInfoViewBodyState();
}

class _UserInfoViewBodyState extends State<UserInfoViewBody> {
  File? image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  void selectImage() async {
    image = await pichImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    selectImage();
                  },
                  child: image == null
                      ? const CircleAvatar(
                          backgroundColor: AppColors.secondaryColor,
                          radius: 70,
                          child: Icon(
                            Icons.account_circle,
                            color: AppColors.primaryColor,
                            size: 70,
                          ),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(image!),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  prefixIcon:
                      const Icon(Icons.person, color: AppColors.secondaryColor),
                  textInputType: TextInputType.name,
                  controller: nameController,
                  hintText: 'Enter Your Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  prefixIcon:
                      const Icon(Icons.email, color: AppColors.secondaryColor),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: 'Enter Your Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  prefixIcon:
                      const Icon(Icons.info, color: AppColors.secondaryColor),
                  textInputType: TextInputType.name,
                  controller: bioController,
                  hintText: 'Enter Your Bio',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBotton(
                  onPressed: () {
                    stroeData();
                  },
                  text: 'Save',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void stroeData() async {
    await context.read<ProfileCubit>().saveUserInfo(
        name: nameController.text,
        email: emailController.text,
        bio: bioController.text,
        profilePic: image!.path);
    if (image != null) {
    } else {}
  }
}
