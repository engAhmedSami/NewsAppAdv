import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signup_view_body_block_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'Signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'SignUp'),
        body: const SignupViewBodyBlockConsumer(),
      ),
    );
  }
}
