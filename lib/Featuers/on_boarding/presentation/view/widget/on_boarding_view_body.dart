import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Featuers/auth/presentation/view/login_view.dart';
import 'package:newsapp/Featuers/on_boarding/presentation/view/widget/on_boarding_page_view.dart';
import 'package:newsapp/constants.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.secondaryColor,
            color: currentPage == 1
                ? AppColors.secondaryColor
                : AppColors.secondaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomBotton(
                onPressed: () {
                  Prfs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginView.routeName);
                },
                text: 'Get Started'),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
