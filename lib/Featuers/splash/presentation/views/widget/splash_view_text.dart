import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_styles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
    required AnimationController controller,
    required Animation<double> opacityAnimation,
    required Animation<double> scaleAnimation,
  })  : _controller = controller,
        _opacityAnimation = opacityAnimation,
        _scaleAnimation = scaleAnimation;

  final AnimationController _controller;
  final Animation<double> _opacityAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Opacity(
            opacity: _opacityAnimation.value,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/newsicon-removebg-preview.png',
                    height: 100,
                  ),
                  Text(
                    'News',
                    style: AppStyles.styleBold30.copyWith(
                      color: const Color(0xFF064060),
                    ),
                  ),
                  const Text('Watch', style: AppStyles.styleBold30),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _opacityAnimation,
          child: const Text(
            'All type of news from all trusted sources for all type of people',
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium16,
          ),
        ),
      ],
    );
  }
}
