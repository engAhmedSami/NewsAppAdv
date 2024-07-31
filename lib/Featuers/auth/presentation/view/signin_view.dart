import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'LogIn'),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
