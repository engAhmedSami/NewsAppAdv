import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';

import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/home/presentation/save_info_cubit/profile_cubit.dart';
import 'package:newsapp/Featuers/home/presentation/save_info_cubit/profile_state.dart';
import 'package:newsapp/Featuers/home/presentation/views/widget/user_info_view_body.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: buildAppBarC(
          title: 'User Info',
          context,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomProgrssHud(
                isLoading: state is ProfileLoading ? true : false,
                child: const UserInfoViewBody());
          },
        ),
      ),
    );
  }
}
