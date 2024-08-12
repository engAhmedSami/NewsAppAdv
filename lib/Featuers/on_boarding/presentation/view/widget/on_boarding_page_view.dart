import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Featuers/on_boarding/presentation/view/widget/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: Assets.imagesOnbording1,
          subtitle:
              'Welcome to News App, your reliable source for up-to-date news. Get instant alerts, personalized topics, and exclusive reports. Stay informed effortlessly!',
          isViable: true,
        ),
        PageViewItem(
          image: Assets.imagesOnbording3,
          subtitle:
              'Stay ahead with real-time updates and breaking news. Customize your feed to follow the topics you care about most',
          isViable: false,
        ),
      ],
    );
  }
}
