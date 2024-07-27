import 'package:flutter/material.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Featuers/auth/presentation/view/login_view.dart';
import 'package:newsapp/constants.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.isViable,
  });

  final String image;
  final String subtitle;
  final bool isViable;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                subtitle,
                style: AppStyles.styleMedium16,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Visibility(
          visible: isViable,
          child: Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Prfs.setBool(kIsOnBoardingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Skip',
                  style: AppStyles.styleMedium20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
