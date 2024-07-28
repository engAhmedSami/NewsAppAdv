import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/Core/utils/app_images.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/news_app_text.dart';

class SplashViewText extends StatelessWidget {
  const SplashViewText({
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
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Opacity(
          opacity: _opacityAnimation.value,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: const NewsAppText(),
          ),
        ),
      ),
    );
  }
}

class NewsAppWidget extends StatelessWidget {
  const NewsAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesNewsiconRemovebgPreview,
          height: 100,
        ),
        const SizedBox(width: 10),
        Text(
          'News',
          style:
              AppStyles.styleBold30.copyWith(color: AppColors.secondaryColor),
        ),
        const SizedBox(width: 5),
        const Text('Watch', style: AppStyles.styleBold30),
      ],
    );
  }
}
